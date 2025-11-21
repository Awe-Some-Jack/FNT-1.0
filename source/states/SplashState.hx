package states;

import hxvlc.flixel.FlxVideoSprite;
import lime.app.Application;

class SplashState extends MusicBeatState
{
    public var videoCutscene:FlxVideoSprite;
    override public function create():Void
    {
        ClientPrefs.loadPrefs();

        FlxG.mouse.visible = false;
        
		if(FlxG.save.data.flashing == null && !FlashingState.leftState)
		{
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			MusicBeatState.switchState(new FlashingState());
		}

		FlxTransitionableState.skipNextTransIn = true;
		FlxTransitionableState.skipNextTransOut = true;
		
        startVideo('F&T Splash');
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
            new FlxTimer().start(0.1, function(tmr:FlxTimer)
            {
                MusicBeatState.switchState(new TitleState());
            });
        });
    }
    
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        if (controls.ACCEPT)
        {
            videoCutscene.stop();  
            MusicBeatState.switchState(new TitleState());  
        }
    }
}