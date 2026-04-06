package backend;

#if DISCORD_ALLOWED
import sys.net.Host;
import sys.net.Socket;
import haxe.Http;
import haxe.Json;

class DiscordAuthServer {
    static final CLIENT_ID = "YOUR_CLIENT_ID";
    static final CLIENT_SECRET = "YOUR_CLIENT_SECRET";
    static final REDIRECT_URI = "http://localhost:8080/callback";
    static final PORT = 8080;

    public var onLoginSuccess: (userId: String, username: String) -> Void;
    public var onLoginFail: () -> Void;

    var server: Socket;
    var running: Bool = false;

    public function new() {}

    public function start() {
        server = new Socket();
        server.bind(new Host("localhost"), PORT);
        server.listen(1);
        running = true;

        // 별도 스레드에서 대기
        sys.thread.Thread.create(listenLoop);
    }

    public function stop() {
        running = false;
        server.close();
    }

    public function getAuthUrl(): String {
        var scope = "identify"; // 필요시 email, guilds 등 추가
        return 'https://discord.com/oauth2/authorize'
            + '?client_id=$CLIENT_ID'
            + '&redirect_uri=${StringTools.urlEncode(REDIRECT_URI)}'
            + '&response_type=code'
            + '&scope=$scope';
    }

    function listenLoop() {
        while (running) {
            try {
                var client = server.accept();
                handleClient(client);
            } catch (e) {
                if (running) trace("Server error: " + e);
            }
        }
    }

    function handleClient(client: Socket) {
        var input = client.input.readLine();
        // GET /callback?code=XXXX HTTP/1.1
        var code = extractCode(input);

        // HTTP 200 응답 (브라우저에 표시)
        var html = "<html><body><h2>로그인 성공! 게임으로 돌아가세요.</h2></body></html>";
        client.output.writeString(
            "HTTP/1.1 200 OK\r\n" +
            "Content-Type: text/html; charset=utf-8\r\n" +
            "Content-Length: " + html.length + "\r\n\r\n" +
            html
        );
        client.close();

        if (code != null) {
            exchangeCodeForToken(code);
        } else {
            if (onLoginFail != null) onLoginFail();
        }
    }

    function extractCode(requestLine: String): Null<String> {
        // "GET /callback?code=ABC123 HTTP/1.1"
        var reg = ~/code=([^& ]+)/;
        if (reg.match(requestLine)) {
            return reg.matched(1);
        }
        return null;
    }

    function exchangeCodeForToken(code: String) {
        var http = new haxe.Http("https://discord.com/api/oauth2/token");
        http.setPostData(
            'client_id=$CLIENT_ID' +
            '&client_secret=$CLIENT_SECRET' +
            '&grant_type=authorization_code' +
            '&code=$code' +
            '&redirect_uri=${StringTools.urlEncode(REDIRECT_URI)}'
        );
        http.setHeader("Content-Type", "application/x-www-form-urlencoded");

        http.onData = function(data) {
            var json = Json.parse(data);
            var accessToken: String = json.access_token;
            fetchUserInfo(accessToken);
        };
        http.onError = function(err) {
            trace("Token exchange error: " + err);
            if (onLoginFail != null) onLoginFail();
        };
        http.request(true); // POST
    }

    function fetchUserInfo(accessToken: String) {
        var http = new haxe.Http("https://discord.com/api/users/@me");
        http.setHeader("Authorization", "Bearer " + accessToken);

        http.onData = function(data) {
            var user = Json.parse(data);
            var userId: String = user.id;
            var username: String = user.username;
            trace('로그인 성공: $username ($userId)');
            if (onLoginSuccess != null) {
                onLoginSuccess(userId, username);
            }
        };
        http.onError = function(err) {
            trace("User fetch error: " + err);
            if (onLoginFail != null) onLoginFail();
        };
        http.request(false); // GET
    }
}
#end