package substates;

import states.PlayState;
import states.StoryMenuState;
import states.FreeplayState;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import backend.StageData;

import flixel.FlxSubState;

class OnAntiSubState extends MusicBeatSubstate
{
	var bg:FlxSprite;
	var warning:FlxText;
	var selected:FlxText;

	public function new()
	{
		super();

		FlxG.sound.play(Paths.sound('Exclamation'), 1);

		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

		warning = new FlxText(150, 0, 1000, Language.getPhrase('on_anti', 'You are currently in botplay or practice mode.\nIf you continue playing in this mode, your scores will not be saved and conditions will not be released.\nWould you like to continue?'), 20);
		warning.alignment = CENTER;
		warning.screenCenter(Y);
		warning.alpha = 0;
		warning.font = Paths.font("neodgm.ttf");
		add(warning);

		selected = new FlxText(150, warning.y + 100, 1000, Language.getPhrase('seleted_anti', "is Yes ACCEPT or it's not BACK Button."), 20);
		selected.alignment = CENTER;
		selected.alpha = 0;
		selected.font = Paths.font("neodgm.ttf");
		add(selected);
	}

	override function update(elapsed:Float)
	{
		bg.alpha += elapsed * 1.5;
		if(bg.alpha > 0.6) bg.alpha = 0.6;

		warning.alpha += elapsed * 2.5;
		selected.alpha += elapsed * 2.5;

		if(controls.BACK) {
			StoryMenuState.checkanti = false;
			FlxG.sound.play(Paths.sound('cancelMenu'), 1);
			close();
		} else if(controls.ACCEPT) {
			selectWeek();
			close();
		}
		super.update(elapsed);
	}

	function selectWeek()
	{
		FlxG.camera.flash(ClientPrefs.data.flashing ? FlxColor.WHITE : 0x4CFFFFFF, 0.6);
		FlxG.camera.fade(FlxColor.BLACK, 0.7, false);

		FlxG.sound.music.stop();
		FlxG.sound.play(Paths.sound('select'));

		if (FlxG.save.data != null && FlxG.save.data.blistunlocked == true && FlxG.save.data.allclear == false)
		{
			WeekData.reloadWeekFiles(true);
            PlayState.SONG = Song.loadFromJson('futurology dilemma', 'futurology dilemma');
            PlayState.storyPlaylist = ['futurology dilemma'];
            Difficulty.list = ['Normal'];
            PlayState.storyDifficulty = 0;
		}
		else
		{
			WeekData.reloadWeekFiles(true);
            PlayState.SONG = Song.loadFromJson('new crewmate', 'new crewmate');
            PlayState.storyPlaylist = ['new crewmate', 'accident', 'two suspect', 'reactor alarm', 'get caught'];
            Difficulty.list = ['Normal'];
            PlayState.storyDifficulty = 0;
            PlayState.storyWeek = WeekData.weeksList.indexOf('week1');
		}

		var directory = StageData.forceNextDirectory;
		LoadingState.loadNextDirectory();
		StageData.forceNextDirectory = directory;

		LoadingState.prepareToSong();

		new FlxTimer().start(3.5, function(tmr:FlxTimer)
		{
			StoryMenuState.checkanti = false;
			FlxG.mouse.visible = false;
			LoadingState.loadAndSwitchState(new PlayState(), true);
			FreeplayState.destroyFreeplayVocals();
		});
	}
}