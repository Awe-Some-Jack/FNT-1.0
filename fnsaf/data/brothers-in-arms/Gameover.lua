function onCreate()
    precacheImage("UI/Gameover/died")
    precacheImage("UI/Gameover/Retry")
    precacheImage("UI/Gameover/run")
    precacheImage("UI/Gameover/coward")
    precacheImage("UI/Gameover/corpse")

    setPropertyFromClass("substates.GameOverSubstate", "deathSoundName", "blood Expo")

    makeLuaSprite("died", "UI/Gameover/died")
    scaleObject("died", 0.5, 0.5)
    screenCenter("died", "xy")
    setObjectCamera("died", "other")
    setProperty("died.alpha", 0)

    makeAnimatedLuaSprite("retry", "UI/Gameover/Retry", 150, 110)
    addAnimationByPrefix("retry", "anim", "retry?", 30)
    scaleObject("retry", 0.5, 0.5)
    setObjectCamera("retry", "other")
    setProperty("retry.alpha", 0)

    makeAnimatedLuaSprite("run", "UI/Gameover/run", 830, 320)
    addAnimationByPrefix("run", "anim", "run?", 30)
    scaleObject("run", 0.45, 0.45)
    setObjectCamera("run", "other")
    setProperty("run.alpha", 0)
end

function onCustomSubstateCreate(name)
    if name == "why" then
        runTimer("Exit", 10.5)
        runTimer("Bye", 0.6)

        cameraFlash("other", "ff0000", 0.3, false)

        cameraShake("other", 0.025, 0.3)

        playSound("ohno", 1, "gameOverSound")

        makeLuaSprite("um", "UI/Gameover/corpse")
        scaleObject("um", 0.2, 0.2)
        screenCenter("um", "xy")
        setObjectCamera("um", "other")
        insertToCustomSubstate("um")
           
        makeAnimatedLuaSprite("coward", "UI/Gameover/coward")
        addAnimationByPrefix("coward", "anim", "coward?", 30, true)
        scaleObject("coward", 0.5, 0.5)
        screenCenter("coward", "xy")
        setObjectCamera("coward", "other")
        insertToCustomSubstate("coward")
    end
end

gameOverStuff = {'died', 'retry', 'run'}
alphaStuff = {'um', 'coward'}

function onUpdatePost(elapsed)
    if inGameOver and keyJustPressed("back") then
        openCustomSubstate("why")
    end
end

function onGameOverStart()
    setPropertyFromClass('substates.GameOverSubstate', 'instance.boyfriend.visible', false)
    cameraFlash("other", "ff0000", 1, false)
    addLuaSprite("died")
    addLuaSprite("retry")
    addLuaSprite("run")

    runTimer("Showme", 2.4)
end

function onGameOverConfirm(isAccept)
    if isAccept then
        cancelTimer("Showme")
        cameraFlash("other", "ffffff", 1, false)

        removeLuaSprite("died")
        removeLuaSprite("retry")
        removeLuaSprite("run")
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "Showme" then
        for i = 1,#gameOverStuff do
            doTweenAlpha(gameOverStuff[i]..'tween', gameOverStuff[i], 1, 1)
		end
    end

    if tag == "Bye" then
        for i = 1,#alphaStuff do
            doTweenAlpha(alphaStuff[i]..'tween', alphaStuff[i], 0, 0.8)
		end
    end
end

function onSoundFinished(tag)
    if tag == "gameOverSound" then
        exitSong()
    end
end