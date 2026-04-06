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

    if name == "restart" then
        runTimer("rerun", 3)
        setPropertyFromClass("flixel.FlxG", 'keys.enabled', true)

        cameraFlash("other", "ffffff", 1, false)

        playMusic("gameOverEnd")

        makeLuaSprite("repu", "UI/Gameover/pu-retry")
        scaleObject("repu", 0.25, 0.25)
        screenCenter("repu", "xy")
        setObjectCamera("repu", "other")
        insertToCustomSubstate("repu")

        doTweenAlpha('imagetween', "repu", 0, 1)

        removeLuaSprite("died")
        removeLuaSprite("retry")
        removeLuaSprite("run")
    end
end

gameOverStuff = {'died', 'retry', 'run'}
alphaStuff = {'um', 'coward'}

function mouseOverlaps(tag)
    addHaxeLibrary('Reflect')
    return runHaxeCode([[
        var obj = game.getLuaObject(']]..tag..[[');
        if (obj == null) obj = Reflect.getProperty(game, ']]..tag..[[');
        if (obj == null) return false;
        return obj.getScreenBounds(null, obj.cameras[0]).containsPoint(FlxG.mouse.getScreenPosition(obj.cameras[0]));
    ]])
end

function onUpdatePost(elapsed)
    if inGameOver then
        if mouseClicked("left") and mouseOverlaps("retry") and getProperty("retry.alpha") == 1 then
            openCustomSubstate("restart")
            setPropertyFromClass("flixel.FlxG", "mouse.visible", false)
        end

        if mouseClicked("left") and mouseOverlaps("run") and getProperty("run.alpha") == 1 then
            openCustomSubstate("why")
            setPropertyFromClass("flixel.FlxG", "mouse.visible", false)
        end
    end
end

function onGameOverStart()
    setPropertyFromClass("flixel.FlxG", 'keys.enabled', false)
    setPropertyFromClass('substates.GameOverSubstate', 'instance.boyfriend.visible', false)
    setPropertyFromClass("flixel.FlxG", "mouse.visible", true)
    cameraFlash("other", "ff0000", 1, false)
    addLuaSprite("died")
    addLuaSprite("retry")
    addLuaSprite("run")

    runTimer("Showme", 2.0)
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

    if tag == "rerun" then
        restartSong()
    end
end

function onSoundFinished(tag)
    if tag == "gameOverSound" then
        setPropertyFromClass("flixel.FlxG", 'keys.enabled', true)
        exitSong()
    end
end