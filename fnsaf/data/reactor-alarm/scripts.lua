local sabo = false

local lockX = 0
local lockY = 0
local lockon = false

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

    makeLuaSprite("saboflash", "")
    makeGraphic("saboflash", screenWidth, screenHeight, "ff0000")
    setProperty("saboflash.alpha", 0)
    setObjectCamera("saboflash", "hud")
    addLuaSprite("saboflash")

    if not lowQuality then
        makeAnimatedLuaSprite("AGF", "bg/reactor/beans/AFG idle", -500, 500)
        addAnimationByPrefix("AGF", "idle", "agf idle")
        setProperty("AGF.visible", false)
        scaleObject("AGF", 1.6, 1.6)
        addLuaSprite("AGF")

        makeAnimatedLuaSprite("loyalblue", "bg/reactor/beans/loyalblue idle", 1300, 1200)
        addAnimationByPrefix("loyalblue", "idle", "idle")
        setScrollFactor("loyalblue", 1.1, 1.1)
        scaleObject("loyalblue", 1.2, 1.2)
        addLuaSprite("loyalblue", true)

        makeAnimatedLuaSprite("pudding", "bg/reactor/beans/pd idle", -200, 1200)
        addAnimationByPrefix("pudding", "idle", "IDLES")
        setScrollFactor("pudding", 0.9, 0.9)
        scaleObject("pudding", 1.2, 1.2)
        addLuaSprite("pudding", true)

        makeAnimatedLuaSprite("wally", "bg/reactor/beans/wally idle", 1400, 600)
        addAnimationByPrefix("wally", "idle", "wally idle")
        setProperty("wally.visible", false)
        scaleObject("wally", 1.6, 1.6)
        addLuaSprite("wally")

        makeAnimatedLuaSprite("night", "bg/reactor/beans/ns idle", 1900, 500)
        addAnimationByPrefix("night", "idle", "idleleqa")
        setProperty("night.visible", false)
        scaleObject("night", 1.6, 1.6)
        addLuaSprite("night")
    end
end

function onUpdate(elapsed)
    if lockon then
        setCameraScroll(lockX, lockY)
    end
end

function onEvent(event, value1, value2, strumTime)
    if event == "Highlight Character" then
        if value1 == "1" then
            cameraFlash("hud", "000000", 0.4)
        end
    end
end

function onSectionHit()
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

    if curSection == 115 then
        lockon = true
        lockX = 850
        lockY = 475

        cameraFlash("game", "ffffff", 0.5, false)
        triggerEvent("Tween Cam Zoom", "0.5", "0.01")
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
    end
end

function onStepHit()
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

        cameraFlash("game", "ffffff", 0.4, false)
    end

    if curStep == 1651 then
        doTweenY("hi", "pudding", 800, 1, "cubeOut")
    end

    if curStep == 1712 then
        setProperty("wally.visible", true)
        setProperty("night.visible", true)
        setProperty("AGF.visible", true)
    end

    if curStep == 1784 then
        doTweenY("hi2", "loyalblue", 1000, 1, "cubeOut")
    end


    if curStep == 1980 then
        cameraFade("hud", "000000", 1, false)
    end
end