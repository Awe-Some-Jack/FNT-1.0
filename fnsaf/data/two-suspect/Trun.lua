local Sencond = true

function onCreate()
    callMethod('iconP2.changeIcon', {'agf'})
    setHealthBarColors("d7a33c", "")
end

function onUpdate(elapsed)
    if not mustHitSection and Sencond then
        if framerate == 60 then
            addCameraScroll(-35, 0)
        elseif framerate > 60 and framerate < 150 then
            addCameraScroll(-16, 0)
        elseif framerate >= 150 and framerate < 200 then
            addCameraScroll(-13, 0)
        elseif framerate >= 200 then
            addCameraScroll(-10, 0)
        end
    else

    end

    if not mustHitSection then
        doTweenAlpha("opponealpha", "dad", 1, 0.2)
        doTweenAlpha("opponealpha2", "AGF", 1, 0.2)
    else
        doTweenAlpha("opponealpha", "dad", 0, 0.2)
        doTweenAlpha("opponealpha2", "AGF", 0, 0.2)
    end
end

local function rgbToHex(t)
    return string.format('%02X%02X%02X', t[1], t[2], t[3])
end

function goodNoteHit(index, noteData, noteType, isSustain)
    if noteType == "GF Sing" or gfSection then
        callMethod('iconP1.changeIcon', {'puppy'})
        setHealthBarColors("", "a54cff")
    else
        callMethod('iconP1.changeIcon', {'bf'})
        setHealthBarColors("", rgbToHex(getProperty('boyfriend.healthColorArray')))
    end
end

function onGameOverStart()
    Sencond = false
end

function onEvent(eventName, value1, value2, strumTime)
    if eventName == "Highlight Character" and value1 == "1" then
        runHaxeCode([[ 
        var objName = "AGF"; 
        if (game.getLuaObject(objName) != null) {
        FlxTween.tween(game.getLuaObject(objName).colorTransform, { redOffset: 0, greenOffset: 0, blueOffset: 0, redMultiplier: 1, greenMultiplier: 1, blueMultiplier: 1 }, 0.001);
        } else {
            trace("Object not found: " + objName);
        }
    ]])
    end
end

function onStepHit()
    if curStep == 688 or curStep == 848 or curStep == 928 or curStep == 1047 then
        Sencond = false
    end 

    if curStep == 768 or curStep == 896 or  curStep == 993 or curStep == 1088 then
        Sencond = true
    end 
end