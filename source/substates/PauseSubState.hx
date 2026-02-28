package substates;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import flixel.util.FlxStringUtil;
import substates.StickerSubState;

import states.StoryMenuState;
import states.FreeplayState;
import options.OptionsState;

class PauseSubState extends MusicBeatSubstate
{
	var grpMenuShit:FlxTypedGroup<Alphabet>;

	var items:FlxTypedGroup<FlxSprite>;

	var shit:Array<String> = ['resume', 'restart', 'setting', 'exit'];
	var difficultyChoices = [];
	var curSelected:Int = 0;

	var pauseMusic:FlxSound;
	var curTime:Float = Math.max(0, Conductor.songPosition);

	public static var songName:String = null;

	override function create()
	{
		for (i in 0...Difficulty.list.length) {
			var diff:String = Difficulty.getString(i);
			difficultyChoices.push(diff);
		}
		difficultyChoices.push('BACK');

		pauseMusic = new FlxSound();
		try
		{
			var pauseSong:String = getPauseSong();
			if(pauseSong != null) pauseMusic.loadEmbedded(Paths.music(pauseSong), true, true);
		}
		catch(e:Dynamic) {}
		pauseMusic.volume = 0;
		pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));

		FlxG.sound.list.add(pauseMusic);

		var bg:FlxSprite = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
		bg.scale.set(FlxG.width, FlxG.height);
		bg.updateHitbox();
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

		var mumble:FlxSprite = new FlxSprite(1160,243);
		mumble.frames = Paths.getSparrowAtlas('UI/pause/mr.mumble');
		mumble.animation.addByPrefix('anim1', "mr.mumble neutral", 16);
		mumble.animation.addByPrefix('anim2', "mr.mumble worry", 16);
		mumble.animation.addByPrefix('anim3', "mr.mumble talk", 16);
		mumble.animation.addByPrefix('anim4', "mr.mumble mum", 16);
		mumble.animation.play('anim' + FlxG.random.int(1,4));
		mumble.setGraphicSize(Std.int(mumble.width * 0.6));
		mumble.updateHitbox();
		mumble.antialiasing = ClientPrefs.data.antialiasing;
		add(mumble);

		var bubble:FlxSprite = new FlxSprite(30,30);
		bubble.frames = Paths.getSparrowAtlas('UI/pause/speech-bubble');
		bubble.animation.addByPrefix('anim', "speech-bubble 1", 24);
		bubble.animation.play('anim');
		bubble.setGraphicSize(Std.int(bubble.width * 0.6));
		bubble.alpha = 0;
		bubble.updateHitbox();
		bubble.antialiasing = ClientPrefs.data.antialiasing;
		add(bubble);

		var bar:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image('UI/pause/bar'));
		bar.alpha = 0;
		bar.updateHitbox();
		bar.screenCenter();
		bar.antialiasing = ClientPrefs.data.antialiasing;
		add(bar);

		var menuSide:FlxSprite = new FlxSprite(-120,0).loadGraphic(Paths.image('UI/pause/menu'));
		menuSide.updateHitbox();
		menuSide.setGraphicSize(Std.int(menuSide.width * 0.7));
		menuSide.screenCenter(Y);
		menuSide.antialiasing = ClientPrefs.data.antialiasing;
		add(menuSide);

		items = new FlxTypedGroup<FlxSprite>();
		add(items);

		for (i in 0...shit.length)
		{
			var button:FlxSprite = new FlxSprite(0, 260);
			button.frames = Paths.getSparrowAtlas('UI/pause/' + shit[i]);
			button.animation.addByPrefix('idle', shit[i] + " idle", 24);
			button.animation.addByPrefix('selected', shit[i] + " selcet", 24);
			button.animation.play('idle');
			button.setGraphicSize(Std.int(button.width * 0.65));
			button.ID = i;
			items.add(button);
			button.scrollFactor.set();
			button.antialiasing = ClientPrefs.data.antialiasing;
			button.updateHitbox();
	
			switch(i) {
				case 0:
					button.setPosition(40, -83);
				case 1:
					button.setPosition(30, 64);
				case 2:
					button.setPosition(225, 155);
				case 3:
					button.setPosition(-30, 230);
			}
			changeItem();
	
		}

		FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(bar, {alpha: 1}, 0.4);
		FlxTween.tween(mumble, {x: 670}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3, onComplete: (_) -> {
            FlxTween.tween(bubble, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut});
	    }});

		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];

		super.create();
	}
	
	function getPauseSong()
	{
		var formattedSongName:String = (songName != null ? Paths.formatToSongPath(songName) : '');
		var formattedPauseMusic:String = Paths.formatToSongPath(ClientPrefs.data.pauseMusic);
		if(formattedSongName == 'none' || (formattedSongName != 'none' && formattedPauseMusic == 'none')) return null;

		return (formattedSongName != '') ? formattedSongName : formattedPauseMusic;
	}

	var holdTime:Float = 0;
	var cantUnpause:Float = 0.1;
	override function update(elapsed:Float)
	{
		cantUnpause -= elapsed;
		if (pauseMusic.volume < 0.5)
			pauseMusic.volume += 0.01 * elapsed;

		super.update(elapsed);

		if(controls.BACK)
		{
			close();
			return;
		}

		if(FlxG.keys.justPressed.F5)
		{
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			PlayState.nextReloadAll = true;
			MusicBeatState.resetState();
		}

		if (controls.UI_UP_P)
		{
			changeItem(-1);
		}
		if (controls.UI_DOWN_P)
		{
			changeItem(1);
		}

		if (controls.ACCEPT && (cantUnpause <= 0 || !controls.controllerMode))
		{
			var daChoice:String = shit[curSelected];
		    switch (daChoice)
			{
				case "resume":
					close();
				case "restart":
					restartSong();
				case 'setting':
					PlayState.instance.paused = true; // For lua
					PlayState.instance.vocals.volume = 0;
					PlayState.instance.canResync = false;
					MusicBeatState.switchState(new OptionsState());
					if(ClientPrefs.data.pauseMusic != 'None')
					{
						FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), pauseMusic.volume);
						FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.8);
						FlxG.sound.music.time = pauseMusic.time;
					}
					OptionsState.onPlayState = true;
				case "exit":
					#if DISCORD_ALLOWED DiscordClient.resetClientID(); #end
					PlayState.deathCounter = 0;
					PlayState.seenCutscene = false;

					PlayState.instance.canResync = false;
					Mods.loadTopMod();
					if (PlayState.isStoryMode)
					{
						PlayState.storyPlaylist = [];
						openSubState(new StickerSubState(null, (sticker) -> new StoryMenuState(sticker)));
					}
					else
					{
						openSubState(new StickerSubState(null, (sticker) -> new FreeplayState(sticker)));
					}
					PlayState.changedDifficulty = false;
					PlayState.chartingMode = false;
					FlxG.camera.followLerp = 0;
			}
		}
	}

	public static function restartSong(noTrans:Bool = false)
	{
		PlayState.instance.paused = true; // For lua
		FlxG.sound.music.volume = 0;
		PlayState.instance.vocals.volume = 0;

		if(noTrans)
		{
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
		}
		MusicBeatState.resetState();
	}

	override function destroy()
	{
		pauseMusic.destroy();
		super.destroy();
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			
		if (curSelected >= shit.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = shit.length - 1;
			
		items.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();
			
			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(shit.length > 4) {
					add = shit.length * 8;
				}
			}
		});
	}
}
