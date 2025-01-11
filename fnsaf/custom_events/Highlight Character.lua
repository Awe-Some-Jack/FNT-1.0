function onCreate()
    runHaxeCode([[
        import flixel.util.FlxSpriteUtil;
        function highlight(brightness) {
            for (spr in FlxG.state.members) {
                if ([game.gfGroup, game.boyfriendGroup, game.dadGroup].contains(spr))
                    continue;
                if (spr.camera != game.camGame)
                    continue;
                try {
                    FlxSpriteUtil.setBrightness(spr, brightness);
                } catch(e:Dynamic) {trace("cannot apply brightness to sprite: " + Std.string(spr));}
            }
        }
    ]])
end

function onEvent(eventName, value1, value2, strumTime)
    if eventName ~= "Highlight Character" then return end
    runHaxeFunction("highlight", {value1 == "1" and -0.5 or 0})
end
