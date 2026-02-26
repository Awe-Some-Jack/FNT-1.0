local retry = false
local getout = false

function onCreate()
    setPropertyFromClass("substates.GameOverSubstate", "deathSoundName", "None")
end

function onStartCountdown()
    setPropertyFromClass("flixel.FlxG", "fullscreen", false)
end

function onCustomSubstateCreate(name)
    if name == "uhm" then
        makeAnimatedLuaSprite("fuck", "UI/Gameover/glitchGameover")
        addAnimationByIndices("fuck", "anim", "GameOverScreen", "0", 24, false)
        addAnimationByIndices("fuck", "yes", "GameOverScreen", "1,2,3,4,5,6", 24, true)
        addAnimationByIndices("fuck", "no", "GameOverScreen", "7,8,9,10,11,12", 24, true)
        screenCenter("fuck", "xy")
        setObjectCamera("fuck", "other")
        playAnim("fuck", "anim")
        insertToCustomSubstate("fuck")

        makeLuaSprite("hitbox", nil, 153, 380)
        makeGraphic("hitbox", 330, 120, "00FF00")
        setProperty("hitbox.visible", false)
        setObjectCamera("hitbox", "other")
        insertToCustomSubstate("hitbox")

        makeLuaSprite("hitbox2", nil, 810, 350)
        makeGraphic("hitbox2", 330, 120, "FF0000")
        setProperty("hitbox2.visible", false)
        setObjectCamera("hitbox2", "other")
        insertToCustomSubstate("hitbox2")

        playSound("BSOD Buzzing", 1, "Damnit", true)
    end
end

function mouseOverlaps(tag)
    addHaxeLibrary('Reflect')
    return runHaxeCode([[
        var obj = game.getLuaObject(']]..tag..[[');
        if (obj == null) obj = Reflect.getProperty(game, ']]..tag..[[');
        if (obj == null) return false;
        return obj.getScreenBounds(null, obj.cameras[0]).containsPoint(FlxG.mouse.getScreenPosition(obj.cameras[0]));
    ]])
end

function onCustomSubstateUpdatePost(name, elapsed)
    if name == "uhm" then
        if mouseClicked("left") and mouseOverlaps("hitbox") and not retry then
            runTimer("rerun", 3.5)
            runTimer("fade", 1)
            retry = true
            playMusic("gameOverEnd")
            stopSound("Damnit")
            playAnim("fuck", "yes")
            setPropertyFromClass("flixel.FlxG", 'keys.enabled', true)
        end

        if mouseClicked("left") and mouseOverlaps("hitbox2") and not getout then
            runTimer("exit", 0.5)
            getout = true
            playAnim("fuck", "no")

        end
    end
end

function onGameOverStart()
    setPropertyFromClass("flixel.FlxG", "fullscreen", true)
    setPropertyFromClass("flixel.FlxG", 'keys.enabled', false)
    setPropertyFromClass('substates.GameOverSubstate', 'instance.boyfriend.visible', false)
    setPropertyFromClass("flixel.FlxG", "mouse.visible", true)
    openCustomSubstate("uhm")
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "rerun" then
        restartSong()
    end

    if tag == "fade" then
        doTweenAlpha("imageFade", "fuck", 0, 1)
    end

    if tag == "exit" then
        os.exit()
    end
end