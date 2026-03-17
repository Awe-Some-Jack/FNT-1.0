local lockon = false
local xx = 0
local yy = 0
local pause = true

local ffi = require("ffi")

ffi.cdef [[
    int MessageBoxW(void* hWnd, const wchar_t* lpText, const wchar_t* lpCaption, unsigned int uType);
]]

function onCreate()
    setProperty('skipCountdown', true)

    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'None')

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

    makeLuaSprite("visor", "bg/mirahq/blist visor", 0, 0)
    setObjectCamera("visor", "other")
    screenCenter("visor", "xy")
    setProperty("visor.visible", false)
    addLuaSprite("visor")

    makeAnimatedLuaSprite("Crash", "bg/mirahq/crack", 0, 0)
    addAnimationByPrefix("Crash", "anim", "crack crack", 37, false)
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
    setObjectOrder("video", getObjectOrder("dadGroup") - 1)
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
    setPropertyFromClass("flixel.FlxG", "fullscreen", false)
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

    if curStep == 7640 then
        setPropertyFromClass("flixel.FlxG", "fullscreen", true)
        cameraFlash("other", "FFFFFF", 0.3, false)
        removeLuaSprite("fakemenu", true)

        setProperty("visor.visible", true)
        startTween("visorTween", "visor.scale", {x = 1.3, y = 1.2 }, 1, {ease = "backOut"})

        cameraShake("other", 0.3, 0.1)
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
        setProperty("camGame.visible", false)
    end

    if curSection == 482 then
        lockon = true
        xx = 800
        yy = 500
        setProperty("camGame.visible", true)
        removeLuaSprite("visor", true)
        removeLuaSprite("Crash", true)
        triggerEvent("Tween Cam Zoom", "0.4", "0.001")
        cameraFade("hud", "000000", 0.001, false, true)
        cameraFlash("hud", "FFFFFF", 1, false)
        setProperty("boyfriend.visible", false)
    end

    if curSection == 559 then
        cameraFade("hud", "000000", 10, false, false)
    end
end

-- dont touch this part
function sendFakeMessageBox(desc)
    local wideDesc = ffi.new("wchar_t[?]", #desc + 1)
    for i = 1, #desc do
        wideDesc[i - 1] = string.byte(desc, i)
    end
    wideDesc[#desc] = 0 -- the null killer >:)

    local res = ffi.C.MessageBoxW(nil, wideDesc, nil, 0)
    return res
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

function onEndSong()
    if not botPlay then
        cameraFade("other", "FFFFFF", 0.5, false, false)
        runTimer("back", 1)
        playSound("RMVXACE_Magic2")
    else
        sendFakeMessageBox("YOU ARE NOT FUNNY")
        os.exit()
    end
    return Function_Stop
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "back" then
        cameraFade("other", "FFFFFF", 1, false, true)
        runTimer("bye", 2)
    end

    if tag == "bye" then
        sendFakeMessageBox("I WILL BE BACK")
        os.exit()
    end
end