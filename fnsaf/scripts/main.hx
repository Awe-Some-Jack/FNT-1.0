import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import backend.Song;

function onCreate() {
    add(game.gfGroup);
    game.camGame.bgColor = FlxColor.BLACK;
}

function reset(hard = false, now = false) {
    PlayState.nextReloadAll = hard;
    if (now) PlayState.startOnTime = Conductor.songPosition;
    FlxTransitionableState.skipNextTransOut = true;
    FlxG.resetState();
    if (!PlayState.chartingMode)
        PlayState.chartingMode = true;
}

function onUpdate() {
    var shiftMult = 1;
    if (keyboardPressed("SHIFT"))
        shiftMult = 5;

    if (keyboardJustPressed("ONE"))
        if (.25 < game.playbackRate)
            game.playbackRate = Math.max(game.playbackRate - 0.05 * shiftMult, 0.25);

    if (keyboardJustPressed("TWO"))
        if (game.playbackRate < 3)
            game.playbackRate = Math.min(game.playbackRate + 0.05 * shiftMult, 3);

    if (keyboardJustPressed("THREE")) {
        game.clearNotesBefore(game.songLength);
        game.setSongTime(game.songLength - 1000);
    }

    if (keyboardJustPressed("T"))
        reset(keyboardPressed("CONTROL"), keyboardPressed("SHIFT"));
}

function onDestroy() {
    if (FlxG.camera.bgColor != FlxColor.BLACK)
        FlxG.camera.bgColor = FlxColor.BLACK;
}