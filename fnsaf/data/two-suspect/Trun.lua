local Sencond = true

function onUpdate(elapsed)
    if not mustHitSection and Sencond then
        if framerate == 60 then
            addCameraScroll(-30, 0)
        elseif framerate > 60 and framerate < 148 then
            addCameraScroll(-18, 0)
        elseif framerate > 149 and framerate < 199 then
            addCameraScroll(-13, 0)
        elseif framerate > 200 then
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
    if curStep == 432 then
        cameraFlash("hud", "000000", 1.8, false)
    end 

    if curStep == 560 then
        cameraFlash("hud", "000000", 0.8, false)
    end 

    if curStep == 688 or curStep == 848 or curStep == 928 or curStep == 1047 then
        Sencond = false
    end 

    if curStep == 772 or curStep == 896 or curStep == 992 or  curStep == 1091 then
        Sencond = true
    end 
end