local NO = false
local dir = "bg/cafeteria/"

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite("nomiss", getBG("noMiss"), 680, 50)
    setObjectCamera("nomiss", "hud")
    scaleObject("nomiss", 0.9, 0.9)
    setProperty("nomiss.alpha", 0)
    addLuaSprite("nomiss")
end

function noteMiss(index, noteData, noteType, isSustain)
    if NO then
        setProperty('health', -500)
    end
end

function onStepHit()
    if curStep == 1165 then
        NO = true
        doTweenAlpha("HI", "nomiss", 1, 0.3)
    end

    if curStep == 1214 then
        doTweenAlpha("HI", "nomiss", 0, 0.5)
    end

    if curStep == 1422 then
        NO = false
    end
end

function onGameOverStart()
    setProperty("camGame.alpha", 1)
end