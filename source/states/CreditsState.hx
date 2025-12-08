package states;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;

class CreditsState extends MusicBeatState
{
    override public function create():Void
    {
        super.create();

        var xPositions = [20, 300, 580];
        var yStart = 40;
        var yGap = 20;

        var yTrack:Array<Int> = [yStart, yStart, yStart];

        var categories:Array<{title:String, names:Array<String>}> = [
            { title: "Team Leader", names: ["sha_mi0921"] },
            { title: "Team Co-Leader", names: ["AweSomeJack", "snowmelt"] },
            { title: "Programmers", names: ["bpforest", "AweSomeJack"] },
            { title: "Composers", names: ["DevinXD(EX)", "Saf.one", "Aleo", "SDL(EX)", "hmm111", "Mr Takoyaky", "Askliskal", "Keunak"] },
            { title: "Artists", names: ["logan", "snowmelt", "rage_87", "sucheol", "nyangko", "Lemona", "white", "Ahmed Wael Hamdy", "Duolc(EX)", "Amon_creck", "Noobb", "Jamong", "KDH_penup", "Captain", "Dewside", "Dardex"] },
            { title: "Animator", names: ["yuseong0405", "UNION", "neondash", "Fallpillpe", "Retro(EX)", "Amon_creck", "Nanda Pratama", "HAL(EX)"] },
            { title: "Charters", names: ["dia", "Reiad(EX)", "snowmelt"] },
            { title: "Voice Actor", names: ["sha_mi0921 - Space Puppy", "Moon Shark - Wally", "Troll - AGF", "cash - Cream", "mime - Blist"] },
            { title: "Special Thanks", names: ["raul - Brothers in arms Vocal Remaster FLP", "Jio - Glitched Lobbies Collab", "GTM - Bean Edition Collab"] }
        ];

    var columnMap = [0, 0, 0, 0, 1, 1, 2, 2, 2];

    for (i in 0...categories.length)
    {
        var category = categories[i];
        var col = columnMap[i];
        var x = xPositions[col];
        var y = yTrack[col];

        var titleText = new FlxText(x, y, 0, category.title, 16);
        titleText.setFormat(null, 16, FlxColor.YELLOW, LEFT);
        add(titleText);

        y += yGap;

        for (name in category.names)
        {
            var nameText = new FlxText(x + 20, y, 0, name, 14);
            nameText.setFormat(null, 14, FlxColor.WHITE, LEFT);
            add(nameText);
            y += yGap;
        }
            yTrack[col] = y + yGap;
        }
    }

    var quitting:Bool = false;
    override function update(elapsed:Float)
    {
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
		}

		if(!quitting)
		{
			if (FlxG.keys.justPressed.ESCAPE)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
    }
}