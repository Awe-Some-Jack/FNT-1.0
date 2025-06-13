function onCreate()
    setObjectOrder("gfGroup", getObjectOrder("boyfriendGroup") + 1)
end

function onStepHit()
    if curStep == 1639 then
        objectPlayAnimation("gate", "open")
    end

    if curStep == 1652 then
        objectPlayAnimation("who", "bald")
    end

    if curStep == 1657 then
        objectPlayAnimation("who", "alt")
        setProperty("who.x", 1465)
    end

    if curStep == 1984 then
        objectPlayAnimation("who", "hurt")
    end
end