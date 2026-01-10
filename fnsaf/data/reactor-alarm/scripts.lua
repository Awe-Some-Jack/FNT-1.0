local sabo = false

local lockX = 0
local lockY = 0
local lockon = false

local utoched = false

function onCreate()
    precacheImage("bg/reactor/red/1")
    precacheImage("bg/reactor/red/2")
    precacheImage("bg/reactor/red/3")
    precacheImage("bg/reactor/red/4")
    precacheImage("bg/reactor/red/5")
    precacheImage("bg/reactor/red/6")
    precacheImage("bg/reactor/red/7")
    precacheImage("bg/reactor/red/8")
    precacheImage("bg/reactor/red/9")

    makeLuaSprite("dark", "")
    makeGraphic("dark", 2500, 2000, "000000")
    setProperty("dark.visible", false)
    setObjectOrder("dark", getObjectOrder("boyfriendGroup") - 1)
    addLuaSprite("dark")

    makeLuaSprite("saboflash", "")
    makeGraphic("saboflash", screenWidth, screenHeight, "ff0000")
    setProperty("saboflash.alpha", 0)
    setObjectCamera("saboflash", "hud")
    addLuaSprite("saboflash")

    if not lowQuality then
        makeAnimatedLuaSprite("AGF", "bg/reactor/beans/AFG idle", -500, 500)
        addAnimationByPrefix("AGF", "idle", "agf idle", 24, false)
        setProperty("AGF.visible", false)
        scaleObject("AGF", 1.6, 1.6)
        addLuaSprite("AGF")

        makeAnimatedLuaSprite("loyalblue", "bg/reactor/beans/loyalblue idle", 1300, 1300)
        addAnimationByPrefix("loyalblue", "idle", "idle", 24, false)
        setScrollFactor("loyalblue", 1.1, 1.1)
        setProperty("loyalblue.visible", false)
        scaleObject("loyalblue", 1.2, 1.2)
        addLuaSprite("loyalblue", true)

        makeAnimatedLuaSprite("pudding", "bg/reactor/beans/pd idle", -200, 1300)
        addAnimationByPrefix("pudding", "idle", "IDLES", 24, false)
        setScrollFactor("pudding", 0.9, 0.9)
        setProperty("pudding.visible", false)
        scaleObject("pudding", 1.2, 1.2)
        addLuaSprite("pudding", true)

        makeAnimatedLuaSprite("wally", "bg/reactor/beans/wally idle", 1400, 600)
        addAnimationByPrefix("wally", "idle", "wally idle", 24, false)
        setProperty("wally.visible", false)
        scaleObject("wally", 1.6, 1.6)
        addLuaSprite("wally")

        makeAnimatedLuaSprite("night", "bg/reactor/beans/ns idle", 1900, 500)
        addAnimationByPrefix("night", "idle", "idleleqa", 24, false)
        setProperty("night.visible", false)
        scaleObject("night", 1.6, 1.6)
        addLuaSprite("night")

        makeAnimatedLuaSprite("pink", "bg/reactor/beans/dr p", 1650, 580)
        addAnimationByPrefix("pink", "idle", "boydydaz", 24, false)
        setProperty("pink.visible", false)
        scaleObject("pink", 1.6, 1.6)
        addLuaSprite("pink")
    end

    if isStoryMode then
        makeAnimatedLuaSprite('glitch', "bg/reactor/gliched", -400, 250)
	    scaleObject("glitch", 0.15, 0.2)
        updateHitbox("glitch")
        setProperty("glitch.visible", false)
	    addAnimationByPrefix('glitch','anim','gliched' ,24 ,true)
        addLuaSprite("glitch")
    end
end

function onStartCountdown()
    setProperty("camGame.alpha", 0)
    setProperty("camHUD.alpha", 0)

    lockon = true
    lockX = 850
    lockY = 475
    triggerEvent("Tween Cam Zoom", "0.5", "0.01")
end

function onSongStart()
    setProperty("camGame.alpha", 1)
    cameraFade("game", "000000", 2, false, true)
end

function onUpdate(elapsed)
    if lockon then
        setCameraScroll(lockX, lockY)
    end
end

function onUpdatePost(elapsed)
    if mouseClicked("left") and mouseOverlaps("glitch") and getProperty("glitch.visible") then
        utoched = true
        setPropertyFromClass("flixel.FlxG", "mouse.visible", false)
    end

    if utoched then
        openCustomSubstate("Forevnet", true)
    end
end

function onEvent(event, value1, value2, strumTime)
    if event == "Highlight Character" then
        if value1 == "1" then
            cameraFlash("hud", "000000", 0.4)
        end
    end
end

function onCustomSubstateCreate(name)
    if name == "Forevnet" then
        playSound("Flash3")
        cameraShake("game", 0.03, 0.6)
        cameraFade("other", "ffffff", 0.35, false)
        runTimer("Fadeout", 1)
        runTimer("letsgo", 3)
    end
end

function mouseOverlaps(tag)
    addHaxeLibrary('Reflect')
    return runHaxeCode([[
        var obj = game.getLuaObject(']]..tag..[[');
        if (obj == null) obj = Reflect.getProperty(game, ']]..tag..[[');
        if (obj == null) return false;
        return obj.getScreenBounds(null, obj.cameras[0]).containsPoint(FlxG.mouse.getScreenPosition(obj.cameras[0]));
    ]])
end

function onSectionHit()
    if curSection == 2 then
        lockon = false

        triggerEvent("Tween Cam Zoom", "0.9", "")
        setProperty("camHUD.alpha", 1)
        cameraFlash("hud", "ffffff", 0.5, false)
    end

    if curSection == 90 then
        sabo = true
    end

    if curSection == 91 then
        loadGraphic("1", "bg/reactor/red/1")
        loadGraphic("2", "bg/reactor/red/2")
        loadGraphic("3", "bg/reactor/red/3")
        loadGraphic("4", "bg/reactor/red/4")
        loadGraphic("5", "bg/reactor/red/5")
        loadGraphic("6", "bg/reactor/red/6")
        loadGraphic("7", "bg/reactor/red/7")
        loadGraphic("8", "bg/reactor/red/8")
        loadGraphic("9", "bg/reactor/red/9")
    end

    if curSection == 94 then
        triggerEvent("Camera Follow Pos", "1200", "810")
    end

    if curSection == 95 then
        setProperty("dark.visible", true)
        setProperty("dad.alpha", 0)
        cameraFlash("game", "000000", 0.7, false)
    end

    if curSection == 98 then
        triggerEvent("Camera Follow Pos", "", "")
    end

    if curSection == 119 then
        removeLuaSprite("glitch", true)
        setPropertyFromClass("flixel.FlxG", "mouse.visible", false)
    end
end

function onBeatHit()
    if sabo then
        if curBeat % 4 == 0 then
            setProperty("saboflash.alpha", 0.5)
            doTweenAlpha("saboalpha", "saboflash", 0, 0.5)
        end
    end

    if curBeat % 2 == 0 then
        playAnim("AGF", "idle", true)
        playAnim("loyalblue", "idle", true)
        playAnim("pudding", "idle", true)
        playAnim("wally", "idle", true)
        playAnim("night", "idle", true)
        playAnim("pink", "idle", true)
    end
end

function onStepHit()
    if curStep == 28 then
        cameraShake("game", 0.025, 0.2)
    end

    if curStep == 1576 then
        sabo = false
        loadGraphic("1", "bg/reactor/1")
        loadGraphic("2", "bg/reactor/2")
        loadGraphic("3", "bg/reactor/3")
        loadGraphic("4", "bg/reactor/4")
        loadGraphic("5", "bg/reactor/5")
        loadGraphic("6", "bg/reactor/6")
        loadGraphic("7", "bg/reactor/7")
        loadGraphic("8", "bg/reactor/8")
        loadGraphic("9", "bg/reactor/9")

        setProperty("dad.alpha", 1)
        removeLuaSprite("dark", true)

        cameraFlash("game", "ffffff", 0.4, false)
    end

    if curStep == 1651 then
        doTweenY("hi", "pudding", 800, 1, "cubeOut")
        doTweenY("hi2", "loyalblue", 1000, 1, "cubeOut")
        setProperty("loyalblue.visible", true)
        setProperty("pudding.visible", true)
        setProperty("wally.visible", true)
        setProperty("night.visible", true)
        setProperty("pink.visible", true)
        setProperty("AGF.visible", true)
    end

    if curStep == 1844 then
        setProperty("glitch.visible", true)
        setPropertyFromClass("flixel.FlxG", "mouse.visible", true)
    end

    if curStep == 1980 then
        cameraFade("hud", "000000", 1, false)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "Fadeout" then
        setProperty("camGame.visible", false)
        setProperty("camHUD.visible", false)
        cameraFade("other", "ffffff", 0.7, false, true)
    end

    if tag == "letsgo" then
        loadSong("glitch-friend")
    end
end