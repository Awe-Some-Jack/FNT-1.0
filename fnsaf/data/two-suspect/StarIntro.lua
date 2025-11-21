local what = 1
local lol = false

function onCreate()
    setProperty("skipCountdown", true)
    
    precacheImage("bg/cafeteria/sp")
    precacheImage("bg/cafeteria/wally")
    precacheImage("bg/cafeteria/bf")
    precacheImage("bg/cafeteria/agf")

    setProperty("camGame.alpha", 0)
    setProperty("camHUD.alpha", 0)

    makeLuaSprite("BG1", "", 0, 0)
    makeGraphic("BG1", screenWidth, 380, "ffd400")
    setObjectCamera("BG1", "other")
    setProperty("BG1.alpha", 0)
    addLuaSprite("BG1")

    makeLuaSprite("BG2", "", 0, 370)
    makeGraphic("BG2", screenWidth, 350, "79edff")
    setObjectCamera("BG2", "other")
    setProperty("BG2.alpha", 0)
    addLuaSprite("BG2")

    makeLuaSprite("BG3", "")
    makeGraphic("BG3", screenWidth, screenHeight, "b04dfd")
    setObjectCamera("BG3", "other")
    setProperty("BG3.alpha", 0)
    addLuaSprite("BG3")

    makeLuaSprite("spintro", "bg/cafeteria/sp", -600, 350)
    setObjectCamera("spintro", "other")
    scaleObject("spintro", 0.65, 0.65)
    setProperty("spintro.alpha", 0)
    addLuaSprite("spintro")

    makeLuaSprite("bfintro", "bg/cafeteria/bf", 1500, 300)
    setObjectCamera("bfintro", "other")
    scaleObject("bfintro", 0.65, 0.65)
    setProperty("bfintro.alpha", 0)
    addLuaSprite("bfintro")

    makeLuaSprite("agfintro", "bg/cafeteria/agf", 50, 0)
    setObjectCamera("agfintro", "other")
    scaleObject("agfintro", 0.5, 0.5)
    setProperty("agfintro.alpha", 0)
    addLuaSprite("agfintro")

    makeLuaSprite("wallyintro", "bg/cafeteria/wally", 680, 380)
    setObjectCamera("wallyintro", "other")
    scaleObject("wallyintro", 0.5, 0.5)
    setProperty("wallyintro.alpha", 0)
    addLuaSprite("wallyintro")

    setObjectOrder("BG3", 1)

    setObjectOrder("BG1", 2)
    setObjectOrder("agfintro", 3)
    setObjectOrder("BG2", 4)
    setObjectOrder("wallyintro", 5)

    if getRandomBool(5) then
        lol = true
    end

    if lol then
        loadGraphic("agfintro", "bg/cafeteria/agf/lol"..getRandomInt(1, 4))
    end
end

function onSongStart()
    setProperty("agfintro.alpha", 1)
    doTweenX("hiagf", "agfintro", 60, 5)
    doTweenX("hiwally", "wallyintro", 670, 5)
    setProperty("BG1.alpha", 1)
    cameraFlash("other", "ffffff", 0.3, false)
end

function onTweenCompleted(tag)
    if tag == "byeintro1" then
        removeLuaSprite("agfintro", true)
        removeLuaSprite("wallyintro", true)
    end
end

function onStepHit()
    if curStep == 3 then
        setProperty("wallyintro.alpha", 1)
        setProperty("BG2.alpha", 1)
        cameraFlash("other", "ffffff", 0.3, false)
    end

    if curStep == 6 then
        cameraFlash("other", "ffffff", 0.3, false)

        doTweenY("byeintro1", "agfintro", -500, 0.4, "cubeIn")
        doTweenY("byeintro2", "wallyintro", 1500, 0.4, "cubeIn")

        doTweenY("byebg1", "BG1", -500, 0.4, "cubeIn")
        doTweenY("byebg2", "BG2", 1500, 0.4, "cubeIn")

        setProperty("BG3.alpha", 1)
        setProperty("spintro.alpha", 1)
        setProperty("bfintro.alpha", 1)

        cancelTween("hiagf")
        cancelTween("hiwally")
    end

    if curStep == 9 then
        doTweenX("hisp", "spintro", 100, 0.5, "cubeOut")
        doTweenX("hibf", "bfintro", 600, 0.5, "cubeOut")
    end

    if curStep == 15 then
        setProperty("camGame.alpha", 1)
        setProperty("camHUD.alpha", 1)

        cameraFlash("other", "ffffff", 0.5)
        removeLuaSprite("bfintro", true)
        removeLuaSprite("spintro", true)
        removeLuaSprite("BG1", true)
        removeLuaSprite("BG2", true)
        removeLuaSprite("BG3", true)
    end
end