function onSectionHit()
    if curSection == 27 then
        cameraFade("game", "000000", 0.9, false)
    end

    if curSection == 35 then
        cameraFade("game", "000000", 0.001, false, true)
    end
end

function onStepHit()
    if curStep == 442 then
        cameraFlash("hud", "ffffff", 1, false)
    end

    if curStep == 561 then
        cameraFlash("hud", "ffffff", 1, false)
    end
end