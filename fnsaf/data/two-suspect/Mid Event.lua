local utoched = false

function onCreate()
    makeAnimatedLuaSprite("ystar", "bg/cafeteria/yellowstar", 2000, 400)
    addAnimationByPrefix("ystar", "anim", "star??", 24, true)
    setObjectCamera("ystar", getObjectOrder("1") + 1)
    scaleObject("ystar", 0.2, 0.2)
    addLuaSprite("ystar")
end

function onSectionHit()
    if curSection == 27 then
        cameraFade("hud", "000000", 0.9, false)
    end

    if curSection == 61 then
        doTweenX("Moving", "ystar", -500, 10.0)
        setPropertyFromClass("flixel.FlxG", "mouse.visible", true)
        votingIcon("AGF", 230, 250)
    end

    if curSection == 63 then
        votingIcon("dr.pink", 330, 250)
    end

    if curSection == 65 then
        votingIcon("troublue", 430, 250)
    end

    if curSection == 67 then
        votingIcon("melina", 530, 250)
    end

    if curSection == 69 then
        votingIcon("spacePuppy", 600, 550)
        playSound("Voting", 0.4)
    end

    if curSection == 82 then
        votingIcon("wally", 850, 250)
    end

    if curSection == 84 then
        votingIcon("banana", 950, 250)
    end

    if curSection == 86 then
        votingIcon("cream", 1050, 250)
    end

    if curSection == 88 then
        votingIcon("night_smoke", 1150, 270)
    end

    if curSection == 92 then
        setProperty("camGame.alpha", 0)
        cameraFlash("hud", "ffffff", 1.5, false)
        doTweenAlpha("ByeHUD", "camHUD", 0, 1)
    end
end

function mouseOverlaps(tag)
    addHaxeLibrary('Reflect')
    return runHaxeCode([[
        var obj = game.getLuaObject(']] .. tag .. [[');
        if (obj == null) obj = Reflect.getProperty(game, ']] .. tag .. [[');
        if (obj == null) return false;
        return obj.getScreenBounds(null, obj.cameras[0]).containsPoint(FlxG.mouse.getScreenPosition(obj.cameras[0]));
    ]])
end

function onUpdatePost(elapsed)
    if mouseClicked("left") and mouseOverlaps("ystar") then
        utoched = true
        setPropertyFromClass("flixel.FlxG", "mouse.visible", false)
    end

    if utoched then
        openCustomSubstate("Forevnet", true)
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

function onTweenCompleted(tag)
    if tag == "Moving" then
        removeLuaSprite("ystar", true)
        setPropertyFromClass("flixel.FlxG", "mouse.visible", false)
    end
end

function onStepHit()
    if curStep == 443 then
        cameraFade("hud", "000000", 0.4, false, true)
        setProperty("uiGroup.visible", false)

        for i = 0, 7 do
            noteTweenAlpha(i + 16, i, 0.5, 0.001)
        end
    end

    if curStep == 561 then
        cameraFlash("hud", "ffffff", 0.3, false)
        setProperty("uiGroup.visible", true)

        for i = 0, 7 do
            noteTweenAlpha(i + 16, i, 1, 0.001)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "Fadeout" then
        setProperty("camGame.visible", false)
        setProperty("camHUD.visible", false)
        cameraFade("other", "ffffff", 0.7, false, true)
    end

    if tag == "letsgo" then
        loadSong("ggang-ggang")
    end
end

local iconNo = 0
function votingIcon(image, x, y)
    makeLuaSprite("VTicon"..iconNo, getImage(image), x, y)
    scaleObject("VTicon"..iconNo, 0.4, 0.4)
    ystartTween("iconVote", "VTicon"..iconNo..".scale", {x = 0.7, y = 0.7}, 0.5, {ease = "backOut"})
    addLuaSprite("VTicon"..iconNo, true)
    setObjectOrder("VTicon"..iconNo, getObjectOrder("gfGroup") + 1)
    iconNo = iconNo + 1
end

local icondir = "bg/cafeteria/icon/"

function getImage(file)
    return icondir .. file
end