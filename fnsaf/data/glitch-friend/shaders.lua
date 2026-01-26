function onCreatePost()
    if shadersEnabled then
        makeLuaSprite("ShaderImage", nil)
        makeGraphic("ShaderImage", screenWidth, screenHeight)
        setSpriteShader("ShaderImage", "vignetteGlitch")
        setShaderFloat("ShaderImage", "prob", 0)
        setShaderFloat("ShaderImage", "vignetteIntensity", 0)

        runHaxeCode([[
        game.camGame.setFilters([
            new ShaderFilter(game.getLuaObject("ShaderImage").shader)
        ]);
    ]])
    end
end

function onUpdate(elapsed)
    setShaderFloat("ShaderImage", "time", getSongPosition() / 1000)
end

function onStepHit()
    if curStep == 1036 then
        glitchON(0.1, 0.15, 0.3)
    end

    if curStep == 1144 then
        glitchON(0.2, 0.15, 0.35)
    end

    if curStep == 1198 then
        glitchON(0.2, 0.15, 0.1)
    end

    if curStep == 1332 then
        glitchON(0.1, 0.10, 0.1)
    end

    if curStep == 1464 then
        glitchON(0.1, 0.10, 0.4)
    end

    if curStep == 1497 then
        glitchON(0.1, 0.10, 0.1)
    end
end

function glitchON(prob, intensity, time)
    setShaderFloat("ShaderImage", "prob", prob)
    setShaderFloat("ShaderImage", "vignetteIntensity", intensity)

    runTimer("glitchDone", time)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "glitchDone" then
        setShaderFloat("ShaderImage", "prob", 0)
        setShaderFloat("ShaderImage", "vignetteIntensity", 0)
    end
end

function onSectionHit()
    if curSection == 102 then
        setShaderFloat("ShaderImage", "prob", 0.15)
        setShaderFloat("ShaderImage", "vignetteIntensity", 1)
    end
end