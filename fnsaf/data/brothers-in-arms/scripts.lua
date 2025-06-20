local forevent = false
local isgf = false

local Danger = false

cameraevnet = {928, 992, 1280, 1632}
nocameraevnet = {960, 1248, 1376}

function onCreate()
    setProperty("gf.alpha", 0)
    createInstance('testIcon', 'objects.HealthIcon', {'killerpuppy'})
    setProperty("testIcon.flipX", true)
    setProperty("testIcon.alpha", 0)
    addToGroup('uiGroup', "testIcon", getObjectOrder('iconP1', 'uiGroup'))
    setObjectOrder("testIcon", getObjectOrder("iconP1") + 16);
    setObjectCamera("testIcon", "hud")
    addInstance('testIcon', true)
end

function onCreatePost()
    makeLuaSprite("Dangerhealth", "", getProperty("healthBar.x") + 496, getProperty("healthBar.y") + 3)
    makeGraphic("Dangerhealth", 100, 14, "462679")
    setObjectCamera("Dangerhealth", "hud")
    addToGroup('uiGroup', 'Dangerhealth', getObjectOrder('healthBar', 'uiGroup')+1)
    setProperty("Dangerhealth.alpha", 0)
    addLuaSprite("Dangerhealth")
end

function onUpdate(elapsed)
    if isgf and not forevent then
        changestrum()
    elseif not isgf and not forevent then
        changedefault()
    end

    health = getProperty('health')
    if Danger then
        if getProperty('healthBar.percent') < 25 then
 	   	    setProperty('health', health- 500);
		end
    end
end

function onUpdatePost()
    if Danger then
        if getProperty('healthBar.percent') < 50 then
            setProperty('iconP1.animation.curAnim.curFrame',1)
            setProperty('iconP2.animation.curAnim.curFrame',2)
        elseif getProperty('healthBar.percent') > 80 then
            setProperty('iconP1.animation.curAnim.curFrame',2)
            setProperty('iconP2.animation.curAnim.curFrame',1)
        else
            setProperty('iconP1.animation.curAnim.curFrame',0)
            setProperty('iconP2.animation.curAnim.curFrame',0)
        end
    end

    setProperty('testIcon.animation.curAnim.curFrame', getProperty('iconP2.animation.curAnim.curFrame'));
    setProperty("testIcon.x", getProperty("healthBar.x") + 550)
    setProperty("testIcon.y", getProperty("healthBar.y") - 84)
end

function onStepHit()
    if curStep == 907 then
        doTweenX("BFX", "boyfriend", 260, 0.3, "cubeOut")
        doTweenAlpha("HI", "testIcon", 1, 0.2, "linear")
        doTweenAlpha("HI2", "Dangerhealth", 1, 0.2, "linear")
        setProperty("gf.alpha", 1)
        triggerEvent("Play Animation", "anime", "gf")
        
        Danger = true
    end

    if curStep == 1312 then
        forevent = true

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

    if curStep == 1376 then
        forevent = false
        changedefault()

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

    for i = 1,#cameraevnet do 
		if curStep == cameraevnet[i] then
            isgf = true
		end
	end

    for i = 1,#nocameraevnet do 
		if curStep == nocameraevnet[i] then
            isgf = false
		end
	end

    if curStep == 2144 then
        cameraFade("hud", "000000", 0.001, false)
    end
end

function changestrum()
    noteTweenX("bf1", 4, defaultOpponentStrumX0, 1, "cubeOut")
    noteTweenX("bf2", 5, defaultOpponentStrumX1, 1, "cubeOut")
    noteTweenX("bf3", 6, defaultOpponentStrumX2, 1, "cubeOut")
    noteTweenX("bf4", 7, defaultOpponentStrumX3, 1, "cubeOut")

    noteTweenX("opponent1", 0, defaultPlayerStrumX0, 1, "cubeOut")
    noteTweenX("opponent2", 1, defaultPlayerStrumX1, 1, "cubeOut")
    noteTweenX("opponent3", 2, defaultPlayerStrumX2, 1, "cubeOut")
    noteTweenX("opponent4", 3, defaultPlayerStrumX3, 1, "cubeOut")
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