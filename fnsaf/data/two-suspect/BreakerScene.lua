local hud = {"healthBar", "iconP1", "iconP2", "scoreTxt", "timeBar", "TimeTxt"}

function onCreate()
    makeLuaSprite("Redbg", "", -1000, 0)
    makeGraphic("Redbg", 650, screenHeight, "ff0000")
    setObjectCamera("Redbg", "hud")
    screenCenter("Redbg", "y")
    addLuaSprite("Redbg")

    makeLuaSprite("Cyanbg", "", 1500, 0)
    makeGraphic("Cyanbg", 650, screenHeight, "4AC3F7")
    setObjectCamera("Cyanbg", "hud")
    screenCenter("Cyanbg", "y")
    addLuaSprite("Cyanbg")

    createInstance("agfside", "objects.Character", {-1000, -180, "agf-forside", false})
    setObjectCamera("agfside", "hud")
    addInstance("agfside")

    createInstance("bfside", "objects.Character", {1400, 110, "bf-forside", true})
    setObjectCamera("bfside", "hud")
    addInstance("bfside")

    createInstance("spside", "objects.Character", {1300, -170, "sp-forside", false})
    setObjectCamera("spside", "hud")
    addInstance("spside")
end

function onBeatHit()
    if curBeat % 2 == 0 and not stringStartsWith(getProperty("agfside.animation.name"), "sing") and not getProperty("agfside.stunned") then
        playAnim("agfside", "idle", true)
    end

    if curBeat % 2 == 0 and not stringStartsWith(getProperty("bfside.animation.name"), "sing") and not getProperty("bfside.stunned") then
        playAnim("bfside", "idle", true)
    end

    if curBeat % 2 == 0 and not stringStartsWith(getProperty("spside.animation.name"), "sing") and not getProperty("spside.stunned") then
        playAnim("spside", "idle", true)
    end
end

function onSectionHit()
    if curSection == 74 then
        middle()
        setProperty('uiGroup.visible', false)
        cameraFlash("hud", "ffffff", 0.5, false)
        setProperty("camGame.alpha", 0)
        doTweenX("AGF", "agfside", -380, 0.4, "cubeOut")
        doTweenX("RBG", "Redbg", -20, 0.4, "cubeOut")
    end

    if curSection == 78 then
        doTweenX("puppy", "spside", 330, 0.4, "cubeOut")
        doTweenX("CBG", "Cyanbg", 630, 0.4, "cubeOut")
    end

    if curSection == 83 then
        doTweenX("bf", "bfside", 480, 0.4, "cubeOut")
        doTweenX("puppy", "spside", 570, 0.2)
    end
end

function onStepHit()
    if curStep == 1423 then
        changedefault()
        setProperty('uiGroup.visible', true)
        removeLuaSprite("Redbg")
        removeLuaSprite("Cyanbg")
        setProperty("agfside.visible", false)
        setProperty("spside.visible", false)
        setProperty("bfside.visible", false)
        cameraFlash("hud", "ffffff", 0.3, false)
        setProperty("camGame.alpha", 1)

        if not middlescroll then
            noteTweenAlpha("NoteFade1", 0, 1, 1, "cubeOut")
            noteTweenAlpha("NoteFade2", 1, 1, 1, "cubeOut")
            noteTweenAlpha("NoteFade3", 2, 1, 1, "cubeOut")
            noteTweenAlpha("NoteFade4", 3, 1, 1, "cubeOut")
        else
            noteTweenAlpha("NoteFade1", 0, 0.5, 1, "cubeOut")
            noteTweenAlpha("NoteFade2", 1, 0.5, 1, "cubeOut")
            noteTweenAlpha("NoteFade3", 2, 0.5, 1, "cubeOut")
            noteTweenAlpha("NoteFade4", 3, 0.5, 1, "cubeOut")
        end
    end
end

function goodNoteHit(index, noteData, noteType, isSustain) -- Change goodNoteHit to opponentNoteHit if you're doing it for the opponent.
    if noteType == "GF Sing" or gfSection then  -- Do your logic with your custom noteType, check the character, whatever you need to do.
        playAnim("spside", getProperty("singAnimations["..noteData.."]"), true)
        setProperty("spside.holdTimer", 0)
    else
        playAnim("bfside", getProperty("singAnimations["..noteData.."]"), true)
        setProperty("bfside.holdTimer", 0)
        runTimer("bfIdle", 0.3)
    end
end

function opponentNoteHit(index, noteData, noteType, isSustain)
    playAnim("agfside", getProperty("singAnimations["..noteData.."]"), true)
    setProperty("agfside.holdTimer", 0)
end

function onTimerCompleted(tag)
    if tag == "bfIdle" then
        playAnim("bfside", "idle", true)
    end
end

function middle()
    noteTweenX("NoteMove1", 0, 410, 1, "cubeOut")
    noteTweenX("NoteMove2", 1, 520, 1, "cubeOut")
    noteTweenX("NoteMove3", 2, 630, 1, "cubeOut")
    noteTweenX("NoteMove4", 3, 740, 1, "cubeOut")
    noteTweenX("NoteMove5", 4, 410, 1, "cubeOut")
    noteTweenX("NoteMove6", 5, 520, 1, "cubeOut")
    noteTweenX("NoteMove7", 6, 630, 1, "cubeOut")
    noteTweenX("NoteMove8", 7, 740, 1, "cubeOut")
    noteTweenAlpha("NoteFade1", 0, 0, 1, "cubeOut")
    noteTweenAlpha("NoteFade2", 1, 0, 1, "cubeOut")
    noteTweenAlpha("NoteFade3", 2, 0, 1, "cubeOut")
    noteTweenAlpha("NoteFade4", 3, 0, 1, "cubeOut")
end

function changedefault()
    noteTweenX("bf1", 4, defaultPlayerStrumX0, 1, "cubeOut")
    noteTweenX("bf2", 5, defaultPlayerStrumX1, 1, "cubeOut")
    noteTweenX("bf3", 6, defaultPlayerStrumX2, 1, "cubeOut")
    noteTweenX("bf4", 7, defaultPlayerStrumX3, 1, "cubeOut")

    noteTweenX("opponent1", 0, defaultOpponentStrumX0, 1, "cubeOut")
    noteTweenX("opponent2", 1, defaultOpponentStrumX1, 1, "cubeOut")
    noteTweenX("opponent3", 2, defaultOpponentStrumX2, 1, "cubeOut")
    noteTweenX("opponent4", 3, defaultOpponentStrumX3, 1, "cubeOut")
end