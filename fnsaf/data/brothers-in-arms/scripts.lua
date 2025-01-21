function onCreate()
    setProperty("gf.alpha", 0)
end

function onStepHit()
    if curStep == 907 then
        doTweenX("BFX", "boyfriend", 260, 0.3, "cubeOut")
        setProperty("gf.alpha", 1)
        triggerEvent("Play Animation", "anime", "gf")
    end
end