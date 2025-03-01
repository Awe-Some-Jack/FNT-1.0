local Sencond = true

function onUpdatePost(elapsed)
    if not mustHitSection and Sencond then
        addCameraScroll(-30, 0)
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

    if curStep == 688 then
        Sencond = false
    end 

    if curStep == 992 then
        Sencond = true
    end 

    if curStep == 1047 then
        Sencond = false
    end 

    if curStep == 1091 then
        Sencond = true
    end 
end