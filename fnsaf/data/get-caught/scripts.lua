function onCreate()
    setProperty("gf.alpha", 0)
end

function onStepHit()
    if curStep == 1340 then
        doTweenAlpha("angel", "gf", 0.5, 1, "linear")
    end
end