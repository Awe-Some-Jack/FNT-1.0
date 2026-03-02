function onCreate()
    makeLuaSprite("Opponebg", "", -1000, 0)
    makeGraphic("Opponebg", 650, screenHeight, "2A872A")
    setObjectCamera("Opponebg", "hud")
    screenCenter("Opponebg", "y")
    addLuaSprite("Opponebg")

    makeLuaSprite("Opponebg2", "", -1000, 0)
    makeGraphic("Opponebg2", 650, screenHeight, "501F82")
    setObjectCamera("Opponebg2", "hud")
    screenCenter("Opponebg2", "y")
    addLuaSprite("Opponebg2")

    createInstance("blistside", "objects.Character", { -1700, -460, "blist-outside", false })
    setObjectCamera("blistside", "hud")
    addInstance("blistside")

    createInstance("puppyexeside", "objects.Character", { -1600, -190, "puppyexe-outside", false })
    setObjectCamera("puppyexeside", "hud")
    addInstance("puppyexeside")

    makeLuaSprite("Playerbg", "", 1500, 0)
    makeGraphic("Playerbg", 650, screenHeight, "4AC3F7")
    setObjectCamera("Playerbg", "hud")
    screenCenter("Playerbg", "y")
    addLuaSprite("Playerbg")

    createInstance("bfside", "objects.Character", {1400, 110, "bf-forside", true})
    setObjectCamera("bfside", "hud")
    addInstance("bfside")
end

function onBeatHit()
    if curBeat % 2 == 0 and not stringStartsWith(getProperty("blistside.animation.name"), "sing") and not getProperty("blistside.stunned") then
        playAnim("blistside", "idle", true)
    end

    if curBeat % 2 == 0 and not stringStartsWith(getProperty("puppyexeside.animation.name"), "sing") and not getProperty("puppyexeside.stunned") then
        playAnim("puppyexeside", "idle", true)
    end

    if curBeat % 2 == 0 and not stringStartsWith(getProperty("bfside.animation.name"), "sing") and not getProperty("bfside.stunned") then
        playAnim("bfside", "idle", true)
    end

end

function onUpdate(elapsed)
    if getProperty('uiGroup.visible') and not botPlay then
        setProperty("botplayTxt.visible", false)
    end
end

function onSectionHit()
    if curSection == 62 then
        cameraFlash("hud", "ffffff", 0.5, false)
        setProperty("camGame.alpha", 0)
        doTweenX("Blist", "blistside", -700, 0.4, "cubeOut")
        doTweenX("RBG", "Opponebg", -20, 0.4, "cubeOut")
    end

    if curSection == 72 then
        cameraFlash("hud", "ffffff", 0.7, false)
        setProperty("camGame.alpha", 1)
        setProperty("Opponebg.color", getColorFromHex("501F82"))
        removeLuaSprite("Opponebg", true)
        setProperty("Playerbg.x", 1500)
        setProperty("blistside.x", -1700)
        setProperty("bfside.x", 1400)
    end

    if curSection == 88 then
        cameraFlash("hud", "ffffff", 0.5, false)
        setProperty("camGame.alpha", 0)
        doTweenX("puppyexe", "puppyexeside", -300, 0.4, "cubeOut")
        doTweenX("RBG", "Opponebg2", -20, 0.4, "cubeOut")
    end

    if curSection == 90 then
        doTweenX("bf", "bfside", 590, 0.4, "cubeOut")
        doTweenX("CBG", "Playerbg", 630, 0.4, "cubeOut")
    end

    if curSection == 104 then
        cameraFlash("hud", "ffffff", 0.5, false)
        removeInstance("blistside")
        removeInstance("puppyexeside")
        removeInstance("bfside")
        removeLuaSprite("Opponebg2", true)
        removeLuaSprite("Playerbg", true)
        setProperty("camGame.alpha", 1)
    end
end

function onStepHit()
    if curStep == 946 then
        doTweenX("bf", "bfside", 590, 0.4, "cubeOut")
        doTweenX("CBG", "Playerbg", 630, 0.4, "cubeOut")
    end
end

function goodNoteHit(index, noteData, noteType, isSustain) -- Change goodNoteHit to opponentNoteHit if you're doing it for the opponent.
    playAnim("bfside", getProperty("singAnimations["..noteData.."]"), true)
    setProperty("bfside.holdTimer", 0)
    runTimer("bfIdle", 0.3)
end

function opponentNoteHit(index, noteData, noteType, isSustain)
    playAnim("blistside", getProperty("singAnimations["..noteData.."]"), true)
    setProperty("blistside.holdTimer", 0)

    playAnim("puppyexeside", getProperty("singAnimations[" .. noteData .. "]"), true)
    setProperty("puppyexeside.holdTimer", 0)
end

function onTimerCompleted(tag)
    if tag == "bfIdle" then
        playAnim("bfside", "idle", true)
    end
end

function removeInstance(obj)
    callMethod(obj..'.kill', {''})
    callMethod('remove', {instanceArg(obj)})
    callMethod(obj..'.destroy', {''})
    callMethod('variables.remove', {obj})
end