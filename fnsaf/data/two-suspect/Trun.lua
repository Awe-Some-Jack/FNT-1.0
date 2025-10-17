local Sencond = true

function onUpdate(elapsed)
    if not mustHitSection and Sencond then
        if framerate == 60 then
            addCameraScroll(-30, 0)
        elseif framerate > 60 and framerate < 150 then
            addCameraScroll(-16, 0)
        elseif framerate >= 150 and framerate < 200 then
            addCameraScroll(-13, 0)
        elseif framerate >= 200 then
            addCameraScroll(-10, 0)
        end
    else

    end
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