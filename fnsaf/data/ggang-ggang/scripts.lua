function onCustomSubstateCreate(name)
    if name == "Forevnet" then
        playSound("Flash3")
        cameraShake("game", 0.03, 0.6)
        cameraFade("other", "ffffff", 0.35, false)
        runTimer("Fadeout", 1)
        runTimer("letsgo", 3)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "Fadeout" then
        setProperty("camGame.visible", false)
        setProperty("camHUD.visible", false)
        cameraFade("other", "ffffff", 0.7, false, true)
    end

    if tag == "letsgo" then
        if isStoryMode then
            loadSong("two-suspect")
        else
            exitSong()
        end
    end
end

function onEndSong()
    callMethodFromClass('backend.Highscore', 'saveScore', {songName, score, difficulty, rating})
    openCustomSubstate("Forevnet", true)
    return Function_Stop
end
