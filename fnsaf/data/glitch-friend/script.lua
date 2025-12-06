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