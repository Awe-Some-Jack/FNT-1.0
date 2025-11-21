package states;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import flixel.group.FlxGroup;
import flixel.graphics.FlxGraphic;

import options.GameplayChangersSubstate;
import substates.ResetScoreSubState;
import substates.StickerSubState;

import backend.StageData;

class StoryMenuState extends MusicBeatState
{
	public static var weekCompleted:Map<String, Bool> = new Map<String, Bool>();

	var weekimage1:FlxSprite;
	var playbutt:FlxSprite;

	var scoreText:FlxText;

	private static var lastDifficultyName:String = '';
	var curDifficulty:Int = 1;

	var txtWeekTitle:FlxText;

	private static var curWeek:Int = 0;

	var txtTracklist:FlxText;

	var loadedWeeks:Array<WeekData> = [];

	var stickerSubState:StickerSubState;
	public function new(?stickers:StickerSubState = null)
	{
		super();
	  
		if (stickers != null)
		{
			stickerSubState = stickers;
		}
	}

	override function create()
	{
		Paths.clearUnusedMemory();

		if (stickerSubState != null)
		{
			//this.persistentUpdate = true;
			//this.persistentDraw = true;
			
			openSubState(stickerSubState);
			Paths.clearStoredWithoutStickers();
			stickerSubState.degenStickers();
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}
		else
		Paths.clearStoredMemory();

		persistentUpdate = persistentDraw = true;
		PlayState.isStoryMode = true;
		WeekData.reloadWeekFiles(true);

		FlxG.mouse.visible = true;

		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		if(WeekData.weeksList.length < 1)
		{
			FlxTransitionableState.skipNextTransIn = true;
			persistentUpdate = false;
			MusicBeatState.switchState(new states.ErrorState("NO WEEKS ADDED FOR STORY MODE\n\nPress ACCEPT to go to the Week Editor Menu.\nPress BACK to return to Main Menu.",
				function() MusicBeatState.switchState(new states.editors.WeekEditorState()),
				function() MusicBeatState.switchState(new states.MainMenuState())));
			return;
		}

		if(curWeek >= WeekData.weeksList.length) curWeek = 0;

		weekimage1 = new FlxSprite(0,0).loadGraphic(Paths.image("UI/story/alright1"));
		weekimage1.screenCenter();
		weekimage1.antialiasing = ClientPrefs.data.antialiasing;
		add(weekimage1);

		playbutt = new FlxSprite(684, 489).loadGraphic(Paths.image("UI/story/button2"));
		playbutt.scale.set(0.75 ,0.68);
		playbutt.updateHitbox();
		playbutt.alpha = 0;
		playbutt.antialiasing = ClientPrefs.data.antialiasing;
		add(playbutt);

		scoreText = new FlxText(580, 135, 0, Language.getPhrase('week_score', 'WEEK SCORE: {1}', [lerpScore]), 36);
		scoreText.setFormat(Paths.font("neodgm.ttf"), 32);

		WeekData.setDirectoryFromWeek(loadedWeeks[0]);

		txtTracklist = new FlxText(FlxG.width * 0.05, 300, 0, "", 32);
		txtTracklist.alignment = CENTER;
		txtTracklist.font = Paths.font("vcr.ttf");
		txtTracklist.color = 0xFFe55777;
		add(txtTracklist);
		add(scoreText);

		super.create();
	}

	override function closeSubState() {
		persistentUpdate = true;
		super.closeSubState();
	}

	override function update(elapsed:Float)
	{
		if(WeekData.weeksList.length < 1)
		{
			if (controls.BACK && !movedBack && !selectedWeek)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				movedBack = true;
				MusicBeatState.switchState(new MainMenuState());
			}
			super.update(elapsed);
			return;
		}

		// scoreText.setFormat(Paths.font("vcr.ttf"), 32);
		if(intendedScore != lerpScore)
		{
			lerpScore = Math.floor(FlxMath.lerp(intendedScore, lerpScore, Math.exp(-elapsed * 30)));
			if(Math.abs(intendedScore - lerpScore) < 10) lerpScore = intendedScore;
	
			scoreText.text = Language.getPhrase('week_score', 'WEEK SCORE: {1}', [lerpScore]);
		}

		// FlxG.watch.addQuick('font', scoreText.font);

		if (!movedBack && !selectedWeek)
		{
			if(FlxG.keys.justPressed.CONTROL)
			{
				persistentUpdate = false;
				openSubState(new GameplayChangersSubstate());
			}
			else if(controls.RESET)
			{
				persistentUpdate = false;
				openSubState(new ResetScoreSubState('', curDifficulty, '', curWeek));
				//FlxG.sound.play(Paths.sound('scrollMenu'));
			}
		}

		if (FlxG.mouse.overlaps(playbutt))
		{
			playbutt.alpha = 1;

			if(FlxG.mouse.pressed && !movedBack && !selectedWeek)
			{
				selectWeek();
			}
		}
		else playbutt.alpha = 0;
		

		if (controls.BACK && !movedBack && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			movedBack = true;
			MusicBeatState.switchState(new MainMenuState());
		}

		super.update(elapsed);
	}

	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;

	var lerpScore:Int = 49324858;
	var intendedScore:Int = 0;

	function selectWeek()
	{
		selectedWeek = true;
		FlxG.camera.flash(FlxColor.WHITE, 0.6);
		FlxG.camera.fade(FlxColor.BLACK, 0.7, false);

		FlxG.sound.music.stop();
		FlxG.sound.play(Paths.sound('select'));

		WeekData.reloadWeekFiles(true);
        PlayState.SONG = Song.loadFromJson('new crewmate', 'new crewmate');
        PlayState.storyPlaylist = ['new crewmate', 'accident', 'two suspect', 'reactor alarm', 'get caught'];
        Difficulty.list = ['Normal'];
        PlayState.storyDifficulty = 0;
        PlayState.storyWeek = WeekData.weeksList.indexOf('week1');

		new FlxTimer().start(3.5, function(tmr:FlxTimer)
		{
			FlxG.mouse.visible = false;
			LoadingState.loadAndSwitchState(new PlayState(), true);
			FreeplayState.destroyFreeplayVocals();
		});
	}

	function updateText()
	{
		var leWeek:WeekData = loadedWeeks[curWeek];
		var stringThing:Array<String> = [];
		for (i in 0...leWeek.songs.length) {
			stringThing.push(leWeek.songs[i][0]);
		}

		txtTracklist.text = '';
		for (i in 0...stringThing.length)
		{
			txtTracklist.text += stringThing[i] + '\n';
		}

		txtTracklist.text = txtTracklist.text.toUpperCase();

		txtTracklist.screenCenter(X);
		txtTracklist.x -= FlxG.width * 0.35;

		#if !switch
		intendedScore = Highscore.getWeekScore(loadedWeeks[curWeek].fileName, curDifficulty);
		#end
	}
}
