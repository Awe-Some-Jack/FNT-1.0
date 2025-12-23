local singtype = 1

function onCreate()
    createInstance("agfexe-final", "objects.Character", {-175, -600, "agf-exe-final", false})
    setObjectOrder("agfexe-final", getObjectOrder("dadGroup") + 1)
    setProperty("agfexe-final.visible", false)
    addInstance("agfexe-final")

    createInstance("spexe-final", "objects.Character", {-750, -450, "puppy-evil", false})
    setObjectOrder("spexe-final", getObjectOrder("dadGroup") + 1)
    setProperty("spexe-final.visible", false)
    addInstance("spexe-final")
end

function onBeatHit()
    if curBeat % 2 == 0 and not stringStartsWith(getProperty("agfexe-final.animation.name"), "sing") and not getProperty("agfexe-final.stunned") then
        playAnim("agfexe-final", "idle", true)
    end

    if curBeat % 2 == 0 and not stringStartsWith(getProperty("spexe-final.animation.name"), "sing") and not getProperty("spexe-final.stunned") then
        playAnim("spexe-final", "idle", true)
    end
end

function onSectionHit()
    if curSection == 269 then
        setProperty("agfexe-final.visible", true)
        setProperty("spexe-final.visible", true)
    end
end

function onEvent(event, value1, value2, strumTime)
    if event == "Triple Kill singtype setting" then
        if value1 == "1" then
            singtype = 1
        elseif value1 == "2" then
            singtype = 2
        elseif value1 == "3" then
            singtype = 3
        end
    end
end

function opponentNoteHit(index, noteData, noteType, isSustain)
    if noteType == "Triple kill final for 3 play Note" then
        if singtype == 1 then
            playAnim("spexe-final", getProperty("singAnimations["..noteData.."]"), true)
            setProperty("spexe-final.holdTimer", 0)
        elseif singtype == 2 then

        elseif singtype == 3 then
            playAnim("agfexe-final", getProperty("singAnimations["..noteData.."]"), true)
            setProperty("agfexe-final.holdTimer", 0)
        end
    end
end