function onSectionHit()
    if curSection == 27 then
        cameraFade("hud", "000000", 0.9, false)
    end
end

function onStepHit()
    if curStep == 443 then
        cameraFade("hud", "000000", 0.4, false, true)
        setProperty("uiGroup.visible", false)

        for i=0,7 do
            noteTweenAlpha(i+16, i, 0.5, 0.001)
        end
    end

    if curStep == 561 then
        cameraFlash("hud", "ffffff", 0.1 , false)
        setProperty("uiGroup.visible", true)
        
        for i=0,7 do
            noteTweenAlpha(i+16, i, 1, 0.001)
        end
    end
end