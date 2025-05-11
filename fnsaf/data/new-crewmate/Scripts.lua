function onCreatePost()
    setProperty('dad.idleSuffix', '-alt')
end

function onStartCountdown()
    cameraFade('hud', '000000', 1.5, true, true)
end

function onStepHit()
    if curStep == 117 then
        triggerEvent("Play Animation", "intro anim", "Dad")
        triggerEvent("Alt Idle Animation", "Dad", "")
    end
end