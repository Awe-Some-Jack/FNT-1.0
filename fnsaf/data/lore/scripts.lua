function onCreate()
    setProperty("boyfriend.flipX", false)
    setProperty('dad.color', getColorFromHex('000000'))

    setProperty("boyfriend.x", defaultOpponentX)
    setProperty("boyfriend.y", defaultOpponentY + 420)

    setProperty("dad.x", -1500)
    setProperty("dad.y", -20)

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

local function rgbToHex(t)
    return string.format('%02X%02X%02X', t[1], t[2], t[3])
end

function onSongStart()
    doTweenAlpha("HI", "PlayerSide", 0.5, 1)
    doTweenAlpha("HI2", "itsyou", 1, 1)
    runTimer("Bye", 5)
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
    for i = 0, 3 do
        setProperty('playerStrums.members['..i..'].x', _G['defaultOpponentStrumX'..i])
        setProperty('opponentStrums.members['..i..'].x', _G['defaultPlayerStrumX'..i])
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