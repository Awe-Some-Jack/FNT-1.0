function onCreate()
    setProperty("camGame.alpha", 0)
    setProperty("camHUD.alpha", 0)
end

function onCountdownStarted()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'UI/notes/NOTE_glitchedboobies')
    end

    for i = 0, getProperty("unspawnNotes.length") - 1 do
        if not getProperty("unspawnNotes["..i.."].mustPress") then
            setProperty("unspawnNotes["..i.."].texture", "UI/notes/NOTE_glitchedboobies")
        end
    end
end

function onSectionHit()
    if curSection == 4 then
        cameraFlash("hud", "ffffff", 0.4, false)
    end
end

function onSongStart()
    startVideo("glitcg_2", false, true)
    setProperty("camGame.alpha", 1)
    setProperty("camHUD.alpha", 1)
end

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
        exitSong()
    end
end

function onGameOverStart()
    setPropertyFromClass('substates.GameOverSubstate', 'instance.boyfriend.visible', false)
end

function onEndSong()
    if isStoryMode then
        callMethodFromClass('backend.Highscore', 'saveScore', {songName, score, difficulty, rating})
        openCustomSubstate("Forevnet", true)
    else
        return Function_Continue
    end
    return Function_Stop
end