local dir = "bg/hall/"

function getBG(file)
    return dir .. file
end

function onCreate()
    makeAnimatedLuaSprite('cutscene',getBG("BF-CS"), defaultBoyfriendX - 680, defaultBoyfriendY - 40)
	addAnimationByPrefix('cutscene','anim','Animation' ,12 ,false)
    addLuaSprite("cutscene", true)

    makeLuaText("Subtitle", "sample", 800, 0, 530)
    screenCenter("Subtitle", "x")
    setTextSize("Subtitle", 25)
    setTextFont("Subtitle", "neodgm.ttf")
    setProperty("Subtitle.alpha", 0)
    setTextAlignment("Subtitle", "center")
    setObjectCamera("Subtitle", "other")
    addLuaText("Subtitle")

    makeLuaSprite("Deadbody", getBG("deadbody"), 0, 330)
    scaleObject("Deadbody", 0.37, 0)
    setProperty("Deadbody.visible", false)
    setObjectCamera("Deadbody", "other")
    addLuaSprite("Deadbody")

    if not lowQuality then
        makeAnimatedLuaSprite('among1',getBG("wallyaccident"), 1600, 410)
	    addAnimationByPrefix('among1','idle','wallywalk0' ,24 ,true)
        addLuaSprite("among1", true)

        makeAnimatedLuaSprite('among2',getBG("royalaccident"), -500, 510)
	    addAnimationByPrefix('among2','idle','royalwalk0' ,24 ,true)
        setProperty("among2.flipX", true)
        addLuaSprite("among2", false)

        makeAnimatedLuaSprite('among3',getBG("bananaaccident"), -500, 300)
	    addAnimationByPrefix('among3','idle','bananawalk0' ,24 ,true)
        setProperty("among3.flipX", true)
        addLuaSprite("among3", true)

        makeAnimatedLuaSprite('among4',getBG("creamaccident"), 1600, 300)
	    addAnimationByPrefix('among4','idle','creamwalk0' ,24 ,true)
        addLuaSprite("among4", false)
    end

    makeLuaSprite("hedied", getBG("reddiedead"), -500, 630)
    addLuaSprite("hedied")

    makeLuaSprite("who", getBG("agfsilhouette"), -500, 350)
    addLuaSprite("who")

end

function onSongStart()
    playAnim("cutscene", "anim", true)
end

function onStartCountdown()
    doTweenX("MovingBG", "back1", 8200, 105)
    setProperty("dad.visible", false)
    setProperty("boyfriend.visible", false)
    cameraFade("game", "000000", 1.6, false, true)
    callMethod('iconP2.changeIcon', {'question'})
    setHealthBarColors("white", "")
end

function onSectionHit()
    if curSection == 4 then
        doTweenX("Hi", "boyfriend", defaultBoyfriendX - 200, 3)
    end

    if curSection == 8 then
        doTweenX("MovingBG", "back1", 8200, 105)
        removeLuaSprite("cutscene", true)
        setProperty("boyfriend.visible", true)
    end

    if curSection == 24 then
        doTweenX("MovingAmong", "among1", -1000, 6)
    end

    if curSection == 36 then
        doTweenX("MovingAmong2", "among2", 1500, 6)
    end

    if curSection == 53 then
        doTweenX("MovingAmong3", "among3", 1500, 6)
    end

    if curSection == 65 then
        doTweenX("MovingAmong4", "among4", -1000, 6)
    end

    if curSection == 85 then
        cancelTween("MovingBG")
    end

    if curSection == 93 then
        setProperty("Deadbody.visible", true)
        doTweenY("objectY1", "Deadbody.scale", 0.25, 1, "elasticOut")
    end

    if curSection == 94 then
        doTweenAlpha("objectAlpha", "Deadbody", 0, 1)
    end
end

function onStepHit()
    if curStep == 95 then
        cancelTween("MovingBG")
        setProperty("dad.visible", true)
        callMethod('iconP2.changeIcon', {'puppy'})
        setHealthBarColors("A54CFF", "")

        setProperty("Subtitle.alpha", 1)
        setTextString("Subtitle", "HI There!\n안녕 친구!")
    end

    if curStep == 107 then
        setTextString("Subtitle", "Do You need Help?\n혹시 도움이 필요하니?")
    end

    if curStep == 128 then
        setProperty("Subtitle.alpha", 0)
    end

    if curStep == 1235 then
        doTweenX("WTF", "hedied", -180, 1.3)
    end

    if curStep == 1240 then
        doTweenX("WTF2", "who", -350, 0.8)
    end

    if curStep == 1369 then
        cameraFade("hud", "000000", 0.5, false)
    end
end


function onUpdate(elapsed)
    if not inGameOver then
        setCameraScroll(700, 465)
        cameraSetTarget("bf")
    end
end

function onTweenCompleted(tag)
    if tag == "WTF2" then
        doTweenX("WTF2", "who", -500, 0.2)
    end

    if tag == "MovingAmong" then
        removeLuaSprite("MovingAmong", true)
    end

    if tag == "MovingAmong2" then
        removeLuaSprite("MovingAmong2", true)
    end

    if tag == "MovingAmong3" then
        removeLuaSprite("MovingAmong3", true)
    end

    if tag == "MovingAmong4" then
        removeLuaSprite("MovingAmong4", true)
    end
end