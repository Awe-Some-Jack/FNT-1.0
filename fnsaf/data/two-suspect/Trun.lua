local Sencond = true

function onUpdatePost(elapsed)
    if not mustHitSection and Sencond then
        addCameraScroll(-30, 0)
    else

    end
end

function onStepHit()
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