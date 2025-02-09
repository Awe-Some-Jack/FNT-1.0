function onCreate()
    setProperty("gf.alpha", 0)
    setProperty('skipCountdown',true)
end

function onStepHit()
    if curStep == 784 then
        playSound("AGFGUN", 0.8)
    end

    if curStep == 800 then
        cameraFlash("game", "ffffff", 0.2, false)
        setProperty("shadow.alpha", 0)
        setProperty("light.alpha", 1)
    end
    
    if curStep == 1040 then
        lightOffthe()
    end

    if curStep == 1056 then
        cancelTimer("Black")
        doTweenAlpha("LightLOL", "light", 0, 0.1, "linear")
        doTweenAlpha("ShadowLOL", "shadow", 1, 0.1, "linear")
        cameraFlash("game", "ffffff", 0.2, false)
    end

    if curStep == 1296 then
        objectPlayAnimation('Vent','what' ,false)
    end

    if curStep == 1305 then
        objectPlayAnimation('Vent','are u' ,false)
    end

    if curStep == 1340 then
        doTweenAlpha("angel", "gf", 0.5, 1, "linear")
    end

    if curStep == 1987 then
        doTweenAlpha("angel", "gf", 0, 0.001, "linear")
    end
end

function lightOffthe()
    runTimer("Black", 0.3, 0)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "Black" then
        setProperty("shadow.alpha", 1)
        setProperty("light.alpha", 0)
        runTimer("FadeLight", 0.1)
    end

    if tag == "FadeLight" then
        doTweenAlpha("LightLOL", "light", 1, 0.1, "linear")
        doTweenAlpha("ShadowLOL", "shadow", 0, 0.1, "linear")
    end
end


function onTweenCompleted(tag)
    if tag == "Black" then
        
    end
end