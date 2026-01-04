local singtype = 1

function onCreate()
    setProperty('skipCountdown', true)
    
    createInstance("agfexe-final", "objects.Character", {-175, 1600, "agf-exe-final", false})
    setObjectOrder("agfexe-final", getObjectOrder("gfGroup") + 2)
    setProperty("agfexe-final.visible", false)
    addInstance("agfexe-final")

    createInstance("wallyexe-final", "objects.Character", {450, 1300, "wallyexe-final", false})
    setObjectOrder("wallyexe-final", getObjectOrder("dadGroup") + 2)
    setProperty("wallyexe-final.visible", true)
    addInstance("wallyexe-final")

    createInstance("spexe-final", "objects.Character", {-750, 1500, "puppy-evil", false})
    setObjectOrder("spexe-final", getObjectOrder("dadGroup") + 1)
    setProperty("spexe-final.visible", false)
    addInstance("spexe-final")
end

function onBeatHit()
    if curBeat % 2 == 0 and not stringStartsWith(getProperty("agfexe-final.animation.name"), "sing") and not getProperty("agfexe-final.stunned") then
        playAnim("agfexe-final", "idle", true)
    end

    if curBeat % 2 == 0 and not stringStartsWith(getProperty("wallyexe-final.animation.name"), "sing") and not getProperty("wallyexe-final.stunned") then
        playAnim("wallyexe-final", "idle", true)
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

    if curSection == 301 then
        doTweenY("HI", "spexe-final", -450, 1, "cubeOut")
    end

    if curSection == 309 then
        doTweenY("HI2", "wallyexe-final", -710, 1, "cubeOut")
    end


    if curSection == 317 then
        doTweenY("HI3", "agfexe-final", -600, 1, "cubeOut")
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
            playAnim("wallyexe-final", getProperty("singAnimations["..noteData.."]"), true)
            setProperty("wallyexe-final.holdTimer", 0)
        elseif singtype == 3 then
            playAnim("agfexe-final", getProperty("singAnimations["..noteData.."]"), true)
            setProperty("agfexe-final.holdTimer", 0)
        end
    end
end