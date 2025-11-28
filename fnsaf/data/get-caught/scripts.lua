local dir = "bg/electrical/"

function onCreate()
    setProperty("gf.alpha", 0)
    setProperty("gf.color", getColorFromHex("000000"))
    setProperty('skipCountdown',true)

    makeAnimatedLuaSprite('Door',getBG("door"), -700, 5)
	addAnimationByPrefix('Door','Close','close' ,24 ,false)
    addAnimationByPrefix('Door','FBI','open' ,24 ,false)
    setObjectCamera("Door", "hud")
    setProperty("Door.alpha", 0)
    addLuaSprite("Door", false)

    makeAnimatedLuaSprite('Whatareyou',getBG("Get Caught WTF Run"), 1100, 450)
    scaleObject("Whatareyou", 1.2, 1.2)
    setScrollFactor("Whatareyou", 0.9, 0.9)
	addAnimationByPrefix('Whatareyou','anim','OMG' ,24 ,false)
    setProperty("Whatareyou.alpha", 0)
    setObjectOrder("Whatareyou", getObjectOrder("shadow") - 1)
    addLuaSprite("Whatareyou", true)
end

function getBG(file)
    return dir .. file
end

function onUpdate(elapsed)
    if getProperty('Door.animation.curAnim.name') == 'Close' and getProperty('Door.animation.curAnim.finished') then
        objectPlayAnimation('Door','FBI' ,false)
    end

    if gfSection then
        doTweenAlpha("BFAlpha", "boyfriend", 0.5, 0.3)
    else
        doTweenAlpha("BFAlpha", "boyfriend", 1, 0.3)
    end
end

function onSongStart()
    setProperty("camHUD.visible", false)
    cameraFade("game", "000000", 6, false, true)
end

function onEvent(event, v1, v2, strumTime)
    if event == 'badapplelol' and string.lower(v1) == 'a' then
		doTweenColor('badapplexicon', 'P3', '000000', v2, 'linear')
	end
    
	if event == 'badapplelol' and string.lower(v1) == 'b' then
		doTweenColor('badapplexicon', 'P3', 'FFFFFF', v2, 'linear')
	end
end

function onStepHit()
    if curStep == 1 then
        setProperty("P3.alpha", 0)
        setProperty("P3.color", getColorFromHex("000000"))
    end

    if curStep == 256 then
        setProperty("camHUD.visible", true)
    end

    if curStep == 784 then
        playSound("AGFGUN", 0.8)
    end

    if curStep == 800 then
        cameraFlash("game", "ffffff", 0.2, false)
        setProperty("shadow.alpha", 0)
        setProperty("light.alpha", 1)
        setProperty("Door.alpha", 1)
        objectPlayAnimation('Door','Close' ,false)

    end

    if curStep == 928 then
        objectPlayAnimation('Door','Close' ,false)
    end
    
    if curStep == 1040 then
        lightOffthe()
    end

    if curStep == 1056 then
        cancelTimer("Black")
        removeLuaSprite("light", false)
        cameraFlash("game", "ffffff", 0.2, false)
        doTweenAlpha("ShadowLOL", "shadow", 1, 0.001, "linear")
        cancelTimer("FadeLight")
    end

    if curStep == 1296 then
        objectPlayAnimation('Vent','what' ,false)
    end

    if curStep == 1305 then
        objectPlayAnimation('Vent','are u' ,false)
    end

    if curStep == 1340 then
        setProperty("gf.alpha", 1)
        doTweenAlpha("iconHI", "P3", 1, 1)
    end

    if curStep == 1472 then
        setProperty("gf.color", getColorFromHex("ffffff"))
        setProperty("P3.color", getColorFromHex("ffffff"))
    end

    if curStep == 2064 then
        setProperty("Whatareyou.alpha", 1)
        playAnim("Whatareyou", "anim")
    end
end

function lightOffthe()
    runTimer("Black", 0.3, 0)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "Black" then
        setProperty("shadow.alpha", 1)
        setProperty("light.alpha", 0)
        runTimer("FadeLight", 0.1)
    end

    if tag == "FadeLight" then
        doTweenAlpha("LightLOL", "light", 1, 0.1, "linear")
        doTweenAlpha("ShadowLOL", "shadow", 0, 0.1, "linear")
    end
end