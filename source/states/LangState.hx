package states;

import flixel.FlxSubState;

import flixel.effects.FlxFlicker;
import lime.app.Application;

class LangState extends MusicBeatState
{
	public static var leftState2:Bool = false;

	var isKR:Bool = false;
	var bg:FlxSprite;
	var seleText:FlxText;
	var enButton:FlxSprite;
	var krButton:FlxSprite;

	override function create()
	{
		super.create();

		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		seleText = new FlxText(0, 200, FlxG.width,
			"Select a Language");
		seleText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER);
		seleText.screenCenter(X);
		add(seleText);

		enButton = new FlxSprite(300, 350).loadGraphic(Paths.image('english'));
		enButton.setGraphicSize(FlxG.width * 0.2);
		enButton.updateHitbox();
		add(enButton);

		krButton = new FlxSprite(enButton.x + 450, enButton.y).loadGraphic(Paths.image('korean'));
		krButton.setGraphicSize(FlxG.width * 0.2);
		krButton.updateHitbox();
		add(krButton);

		changeThing();

		FlxTween.tween(seleText, {alpha: 1.0}, 0.5);
	}

	override function update(elapsed:Float)
	{
		if(leftState2) {
			super.update(elapsed);
			return;
		}
		if (controls.UI_LEFT_P || controls.UI_RIGHT_P) {
			FlxG.sound.play(Paths.sound("scrollMenu"), 0.7);
			changeThing();
		}
		if (controls.ACCEPT) {
			leftState2 = true;
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			if(isKR) {
				ClientPrefs.data.language = 'ko-KR';
				FlxG.sound.play(Paths.sound('confirmMenu'));
				FlxFlicker.flicker(krButton, 1, 0.1, false, true, function(flk:FlxFlicker) {
					new FlxTimer().start(0.5, function (tmr:FlxTimer) {
						FlxTween.tween(seleText, {alpha: 0}, 0.2, {
							onComplete: (_) -> MusicBeatState.switchState(new SplashState())
						});
					});
				});
			} else {
				FlxG.sound.play(Paths.sound('confirmMenu'));
				FlxFlicker.flicker(enButton, 1, 0.1, false, true, function(flk:FlxFlicker) {
					new FlxTimer().start(0.5, function (tmr:FlxTimer) {
						FlxTween.tween(seleText, {alpha: 0}, 0.2, {
							onComplete: (_) -> MusicBeatState.switchState(new SplashState())
						});
					});
				});
			}
		}
		super.update(elapsed);
	}

	function changeThing():Void
	{
		isKR = !isKR;

		if (isKR)
		{
			enButton.alpha = 0.5;
			krButton.alpha = 1;
		}
		else
		{
			enButton.alpha = 1;
			krButton.alpha = 0.5;
		}
	}
}
