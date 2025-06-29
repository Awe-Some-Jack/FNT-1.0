function onCreatePost()
    setProperty('dad.idleSuffix', '-alt')
end

function onStepHit()
    if curStep == 117 then
        triggerEvent("Play Animation", "intro anim", "Dad")
        triggerEvent("Alt Idle Animation", "Dad", "")
    end
end