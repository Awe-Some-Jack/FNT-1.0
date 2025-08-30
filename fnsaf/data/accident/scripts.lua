local dir = "bg/hall/"

function getBG(file)
    return dir .. file
end

function onCreate()
    setProperty("dad.visible", false)

    if not lowQuality then
        makeAnimatedLuaSprite('among1',getBG("wallyaccident"), 1600, 410)
	    addAnimationByPrefix('among1','idle','wallywalk0' ,24 ,true)
        addLuaSprite("among1", true)

        makeAnimatedLuaSprite('among2',getBG("royalaccident"), 1600, 510)
	    addAnimationByPrefix('among2','idle','royalwalk0' ,24 ,true)
        addLuaSprite("among2", true)

        makeAnimatedLuaSprite('among3',getBG("bananaaccident"), 1600, 300)
	    addAnimationByPrefix('among3','idle','bananawalk0' ,24 ,true)
        addLuaSprite("among3", true)

        makeAnimatedLuaSprite('among4',getBG("creamaccident"), 1600, 300)
	    addAnimationByPrefix('among4','idle','creamwalk0' ,24 ,true)
        addLuaSprite("among4", true)
    end

    makeLuaSprite("hedied", getBG("reddiedead"), -500, 630)
    addLuaSprite("hedied")

end

function onStartCountdown()
    cameraFade("game", "000000", 1.6, false, true)
    callMethod('iconP2.changeIcon', {'question'})
    setHealthBarColors("white", "")
end

function onSectionHit()
    if curSection == 8 then
        doTweenX("MovingBG", "back1", 8200, 105)
    end

    if curSection == 24 then
        doTweenX("MovingAmong", "among1", -1000, 6)
    end

    if curSection == 36 then
        doTweenX("MovingAmong2", "among2", -1000, 6)
    end

    if curSection == 53 then
        doTweenX("MovingAmong3", "among3", -1000, 6)
    end

    if curSection == 65 then
        doTweenX("MovingAmong4", "among4", -1000, 6)
    end
end

function onStepHit()
    if curStep == 95 then
        setProperty("dad.visible", true)
        callMethod('iconP2.changeIcon', {'puppy'})
        setHealthBarColors("A54CFF", "")
    end

    if curStep == 1235 then
        doTweenX("WTF", "hedied", -180, 1.3)
    end

    if curStep == 1369 then
        cameraFade("hud", "000000", 0.5, false)
    end
end


function onUpdate(elapsed)
    if not inGameOver then
        setCameraScroll(700, 500)
    end
end