local lockon = false
local xx = 0
local yy = 0
local pause = true

function onCreate()
    setProperty('skipCountdown', true)

    addCharacterToList("blistpre", "dad")
    addCharacterToList("blist", "dad")
    addCharacterToList("blist2", "dad")
    addCharacterToList("blist-puppy", "dad")
    addCharacterToList("puppy-exe", "dad")
    addCharacterToList("darkblist", "dad")
    addCharacterToList("agf-mad", "dad")
    addCharacterToList("blist-melina", "dad")
    addCharacterToList("blist-final", "dad")

    addCharacterToList("bf-n2", "boyfriend")
    addCharacterToList("bf-n3", "boyfriend")
    addCharacterToList("bf-side-dark", "boyfriend")
    addCharacterToList("darkbf", "boyfriend")

    makeLuaSprite("agfeye", "bg/mirahq/agfpart/agfmad-eye", 510, 500)
    setObjectCamera("agfeye", "other")
    setProperty("agfeye.alpha", 0)
    scaleObject("agfeye", 1.5, 1.5)
    addLuaSprite("agfeye")

    makeLuaSprite("fakemenu", "bg/mirahq/fakeMain", 0, 0)
    setObjectCamera("fakemenu", "other")
    screenCenter("fakemenu", "xy")
    setProperty("fakemenu.alpha", 0)
    addLuaSprite("fakemenu")

    makeAnimatedLuaSprite("Crash", "bg/mirahq/crack", 0, 0)
    addAnimationByPrefix("Crash", "anim", "crack crack", 35, false)
    screenCenter("Crash", "xy")
    setProperty("Crash.visible", false)
    setObjectCamera("Crash", "other")
    addLuaSprite("Crash", true)

    makeLuaSprite("vigi", "bg/mirahq/vignette", 0, 0)
    setObjectCamera("vigi", "hud")
    addLuaSprite("vigi")
end 

function onCreatePost()
    createInstance('video', 'hxvlc.flixel.FlxVideoSprite', {0, 0})
    callMethod('video.load', { callMethodFromClass('backend.Paths', 'modsVideo', { 'flashurgameplaying' }) })
    setScrollFactor("video", 0, 0)
    setGraphicSize("video", 2, 2)
    runHaxeCode([[
            getVar("video").bitmap.onEndReached.add(()->{
                remove(getVar("video"));
                removeVar("video");
            });
        ]])
    addInstance('video')
end

function onPause()
    callMethod('video.pause')
end

function onResume()
    callMethod('video.resume')
end

function onUpdate(elapsed)
    if pause then
        setProperty('canPause', true)
    else
        setProperty('canPause', false)
    end

    if lockon then
        setCameraScroll(xx, yy)
    end
end

function onUpdatePost(elapsed)
    if inGameOver then
        stopSound(nil)
    end
end

function onSongStart()
    setProperty('songLength', 601500)
end

function onStepHit()
    if curStep == 1850 then
        cameraFade("hud", "000000", 0.3, false, false)
    end

    if curStep == 2404 then
        doTweenAlpha("eyeAlpha", "agfeye", 1, 0.4)
        doTweenY("eyeTweenY", "agfeye", 300, 0.5, "backOut")
    end

    if curStep == 2664 then
        cameraFlash("hud", "FFFFFF", 0.3, false)
    end

    if curStep == 3868 then
        cameraFade("game", "000000", 0.3, false, false)
    end

    if curStep == 3879 then
        cameraFade("game", "000000", 0.5, false, true)
    end

    if curStep == 7572 then
        doTweenAlpha("fakeHi", "fakemenu", 1, 1)
    end

    if curStep == 7620 then
        runHaxeCode('FlxTween.tween(game, {songLength: FlxG.sound.music.length}, 0.7, {ease: FlxEase.circInOut})')
        playAnim("Crash", "anim", true)
        setProperty("Crash.visible", true)

        cameraShake("other", 0.025, 0.03)
    end
end

function onSectionHit()
    if curSection == 18 then
        cameraFlash("game", "FFFFFF", 1.5, false)
    end

    if curSection == 34 then
        cameraFlash("hud", "FFFFFF", 2, false)
        removeLuaSprite("vigi", true)
    end

    if curSection == 48 then
        cameraSetTarget("dad")
    end

    if curSection == 50 then
        cameraFlash("hud", "FFFFFF", 0.5, false)
    end

    if curSection == 70 then
        cameraFade("hud", "000000", 1, false, false)
    end

    if curSection == 72 then
        cameraFade("hud", "000000", 0.001, false, true)
    end

    if curSection == 120 then
        triggerEvent("Tween Cam Zoom", "0.5", "0.001")
    end

    if curSection == 122 then
        cameraFade("hud", "000000", 0.001, false, true)
        cameraFlash("hud", "FFFFFF", 0.3, false)
    end

    if curSection == 156 then
        cameraFade("game", "000000", 0.001, false, false)
        cameraFlash("hud", "FFFFFF", 0.3, false)
    end

    if curSection == 157 then
        triggerEvent("Tween Cam Zoom", "0.7", "0.001")
        cameraFade("game", "000000", 0.001, false, true)
        cameraFlash("hud", "FFFFFF", 0.3, false)
        removeLuaSprite("agfeye", true)
    end

    if curSection == 205 then
        cameraFlash("hud", "FFFFFF", 0.5, false)
        lockon = true
        xx = 800
        yy = 500
        callMethod('video.play')
    end

    if curSection == 213 then
        cameraFlash("hud", "FFFFFF", 0.5, false)
        setProperty("dad.visible", false)
        xx = 1100
        yy = 600
    end

    if curSection == 215 then
        lockon = false
        setProperty("dad.visible", true)
        cameraFlash("hud", "FFFFFF", 0.5, false)
    end

    if curSection == 230 then
        cameraFade("game", "000000", 0.001, false, false)
    end

    if curSection == 231 then
        cameraFade("game", "000000", 0.001, false, true)
        cameraFlash("hud", "FFFFFF", 0.5, false)
    end

    if curSection == 296 then
        cameraFade("game", "000000", 0.5, false, false)
    end

    if curSection == 297 then
        cameraFade("game", "000000", 0.5, false, true)
    end

    if curSection == 475 then
        cameraFade("hud", "000000", 0.001, false, false)
        cameraFlash("other", "FFFFFF", 0.5, false)
    end

    if curSection == 478 then
        pause = false
    end

    if curSection == 482 then
        lockon = true
        xx = 800
        yy = 500
        removeLuaSprite("fakemenu", true)
        removeLuaSprite("Crash", true)
        triggerEvent("Tween Cam Zoom", "0.4", "0.001")
        cameraFade("hud", "000000", 0.001, false, true)
        cameraFlash("hud", "FFFFFF", 1, false)
        setProperty("boyfriend.visible", false)
    end
end

function onGameOver()
    -- You died! Called every single frame your health is lower (or equal to) zero
    -- return Function_Stop if you want to stop the player from going into the game over screen
    return Function_Stop;
end

function onGameOverStart()
    setPropertyFromClass("flixel.FlxG", 'keys.enabled', false)
    setPropertyFromClass("flixel.FlxG", "fullscreen", true)
    setProperty("camGame.visible", false)
    setProperty("camHUD.visible", false)
    createInstance('Gameovervideo', 'hxvlc.flixel.FlxVideoSprite')
    callMethod('Gameovervideo.load', { callMethodFromClass('backend.Paths', 'modsVideo', { 'blist_gameover' }) })
    runHaxeCode([[
        getVar("Gameovervideo").bitmap.onEndReached.add(()->{
            remove(getVar("Gameovervideo"));
            removeVar("Gameovervideo");
            Sys.exit(0);
        });
    ]])
    setProperty('Gameovervideo.camera', instanceArg('camOther'), false, true)
    addInstance('Gameovervideo')
    callMethod('Gameovervideo.play')
end
