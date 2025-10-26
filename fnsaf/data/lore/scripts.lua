local dir = "bg/hall/"

function getBG(file)
    return dir .. file
end

function onCreate()
    setProperty("boyfriend.flipX", false)
    setProperty('dad.color', getColorFromHex('000000'))

    setProperty("boyfriend.x", defaultOpponentX)
    setProperty("boyfriend.y", defaultOpponentY + 420)

    setProperty("dad.x", -1500)
    setProperty("dad.y", -20)

    if not middlescroll then
        makeLuaSprite("PlayerSide", nil, 80)
        makeGraphic("PlayerSide", 500, screenHeight, "00ffff")
        setObjectCamera("PlayerSide", "hud")
        setProperty("PlayerSide.alpha", 0)
        addLuaSprite("PlayerSide", true)

        makeLuaText("itsyou", "It's Your NOTES", 500, 80, 300)
        setObjectCamera("itsyou", "hud")
        setTextAlignment("itsyou", "center")
        setProperty("itsyou.alpha", 0)
        setTextSize("itsyou", 70)
        addLuaText("itsyou") 
    end

    if not lowQuality then
        makeAnimatedLuaSprite('among1',getBG("wallyaccident"), 1600, 410)
	    addAnimationByPrefix('among1','idle','wallywalk0' ,24 ,true)
        addLuaSprite("among1", true)

        makeAnimatedLuaSprite('among2',getBG("royalaccident"), -500, 510)
	    addAnimationByPrefix('among2','idle','royalwalk0' ,24 ,true)
        setProperty("among2.flipX", true)
        addLuaSprite("among2", false)

        makeAnimatedLuaSprite('among3',getBG("bananaaccident"), -500, 300)
	    addAnimationByPrefix('among3','idle','bananawalk0' ,24 ,true)
        setProperty("among3.flipX", true)
        addLuaSprite("among3", true)

        makeAnimatedLuaSprite('among4',getBG("creamaccident"), 1600, 300)
	    addAnimationByPrefix('among4','idle','creamwalk0' ,24 ,true)
        addLuaSprite("among4", false)
    end
end

local function rgbToHex(t)
    return string.format('%02X%02X%02X', t[1], t[2], t[3])
end

function onSongStart()
    doTweenAlpha("HI", "PlayerSide", 0.5, 1)
    doTweenAlpha("HI2", "itsyou", 1, 1)
    runTimer("Bye", 5)
end

function onSectionHit()
    if curSection == 16 then
       doTweenX("MovingAmong", "among3", 1500, 6)
    end

    if curSection == 36 then
        doTweenX("MovingAmong2", "among4", -1000, 6)
    end

    if curSection == 48 then
        doTweenX("MovingAmong3", "among1", -1000, 6)
    end

    if curSection == 64 then
        doTweenX("MovingAmong4", "among2", 1500, 6)
    end

    if curSection == 85 then
        cancelTween("MovingBG")
    end
end

function onStepHit()
    if curStep == 1148 then
        doTweenX("ItsBlack", "dad", -430, 0.5, "cubeOut")
        doTweenX("umm", "boyfriend", 1100, 0.5, "cubeOut")
        changedefault()
    end

    if curStep == 1152 then
        setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), "3dc7fa")
        callMethod('iconP1.changeIcon', {'bf'})
        callMethod('iconP2.changeIcon', {'face'})

        setHealth(1)
        setProperty('healthBar.leftToRight', false)
        setProperty('iconP1.flipX', false)
        setProperty('iconP2.flipX', false)

        setProperty('dad.color', getColorFromHex('ffffff'))
        cameraFlash("game", "ff0000", 0.5, false)

        cancelTween("MovingBG")
    end

    if curStep == 1536 then
        cameraFlash("hud", "ffffff", 1.5, false)
        doTweenAlpha("ByeHUD", "camHUD", 0, 1)
        setProperty("camGame.alpha", 0)
    end
end

function onCountdownStarted()
    setHealthBarColors(rgbToHex(getProperty('boyfriend.healthColorArray')), "3dc7fa")
    setProperty('healthBar.leftToRight', true)
    callMethod('iconP2.changeIcon', {'bf'})
    if not middlescroll then
        for i = 0, 3 do
            setProperty('playerStrums.members['..i..'].x', _G['defaultOpponentStrumX'..i])
            setProperty('opponentStrums.members['..i..'].x', _G['defaultPlayerStrumX'..i])
        end
    end
    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)

    doTweenX("MovingBG", "back1", 8200, 160)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "Bye" then
        doTweenAlpha("Bye", "PlayerSide", 0, 1)
        doTweenAlpha("Bye2", "itsyou", 0, 1)
    end
end

function onTweenCompleted(tag)
    if tag == "Bye" then
        removeLuaSprite("PlayerSide", true)
        removeLuaText("itsyou", true)
    end
end

function onUpdatePost()
    if not inGameOver then
        setCameraScroll(700, 465)
    end

    cameraSetTarget("bf")

    local pX, oX = getProperty('iconP1.x'), getProperty('iconP2.x')
    if curStep >= 1 or curStep < 1152 then
        setProperty("P3.alpha", 0)
        setProperty('iconP1.x', oX)
        setProperty('iconP2.x', pX)
    end

    if curStep >= 1152 then
        setProperty("P3.alpha", 1)
        setProperty('iconP1.x', pX)
        setProperty('iconP2.x', oX)
    end
end

function onTweenCompleted(tag)
    if tag == "MovingAmong" then
        removeLuaSprite("MovingAmong", true)
    end

    if tag == "MovingAmong2" then
        removeLuaSprite("MovingAmong2", true)
    end

    if tag == "MovingAmong3" then
        removeLuaSprite("MovingAmong3", true)
    end

    if tag == "MovingAmong4" then
        removeLuaSprite("MovingAmong4", true)
    end
end

function changedefault()
    noteTweenX("bf1", 4, defaultPlayerStrumX0, 0.5, "cubeOut")
    noteTweenX("bf2", 5, defaultPlayerStrumX1, 0.5, "cubeOut")
    noteTweenX("bf3", 6, defaultPlayerStrumX2, 0.5, "cubeOut")
    noteTweenX("bf4", 7, defaultPlayerStrumX3, 0.5, "cubeOut")

    noteTweenX("opponent1", 0, defaultOpponentStrumX0, 0.5, "cubeOut")
    noteTweenX("opponent2", 1, defaultOpponentStrumX1, 0.5, "cubeOut")
    noteTweenX("opponent3", 2, defaultOpponentStrumX2, 0.5, "cubeOut")
    noteTweenX("opponent4", 3, defaultOpponentStrumX3, 0.5, "cubeOut")
end