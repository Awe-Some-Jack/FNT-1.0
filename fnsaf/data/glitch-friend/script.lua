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