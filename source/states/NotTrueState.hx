package states;

import hxvlc.flixel.FlxVideoSprite;
import lime.app.Application;

class NotTrueState extends MusicBeatState
{
    public var videoCutscene:FlxVideoSprite;

    override public function create():Void
    {
        FlxG.mouse.visible = false;
		
        startVideo('whoisthat');
        super.create();
    }

    public function startVideo(name:String)
    {
        videoCutscene = new FlxVideoSprite(0, 0);
        add(videoCutscene);
        videoCutscene.load(Paths.video(name));
        videoCutscene.play();
        videoCutscene.alpha = 1;
        videoCutscene.visible = true;
        videoCutscene.bitmap.onEndReached.add(function()
        {
            Sys.exit(0);
        });
    }
}