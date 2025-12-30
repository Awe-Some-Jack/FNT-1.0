local forevent = false
local isgf = false
local udodged = false

local Danger = false

local bfOffsets = {
    idle   = {x = 0,   y = 0},
    singLEFT  = {x = 148, y = 5},
    singDOWN  = {x = -39,  y = -45},
    singUP    = {x = 0, y = -3},
    singRIGHT = {x = -55,  y = -33},
    dodge     = {x = 71,   y = 56}
}

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

    makeLuaText("dodge", "DODGE!!", 500, 0, 300)
    screenCenter("dodge", "x")
    setTextSize("dodge", 100)
    setProperty("dodge.alpha", 0)
    setObjectCamera("dodge", "hud")
    addLuaText("dodge")

    makeLuaSprite("Spacebar", "UI/Spacebar", 380, 420)
    setProperty('Spacebar.antialiasing', false)
    scaleObject("Spacebar", 5.0, 5.0)
    setProperty("Spacebar.alpha", 0)
    setObjectCamera("Spacebar", "hud")
    addLuaSprite("Spacebar", true)
end

dodgeStuff = {'dodge', 'Spacebar'}

function onCreatePost()
    makeLuaSprite("Dangerhealth", "", getProperty("healthBar.x") + 496, getProperty("healthBar.y") + 3)
    makeGraphic("Dangerhealth", 100, 14, "3202b4")
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
        if getProperty('healthBar.percent') < 20 then
 	   	    setProperty('health', health- 500);
		end
    end

    if isgf then
        setProperty("boyfriend.flipX", true)
    else
        setProperty("boyfriend.flipX", false)
    end

    if getProperty('gf.animation.curAnim.name') == 'anime' and getProperty('gf.animation.curAnim.curFrame') == 1 then
        if not udodged then
            setHealth(0)
        end
    end

    if getProperty('Spacebar.alpha') == 1 and keyboardJustPressed("SPACE") then
        udodged = true
    end
end

function onUpdatePost()
    local anim = getProperty("boyfriend.animation.curAnim.name")
    if anim == nil then return end

    local fixedAnim = anim
    if getProperty("boyfriend.flipX") then
        if string.find(anim, "singLEFT") then
            fixedAnim = anim:gsub("LEFT", "RIGHT")
        elseif string.find(anim, "singRIGHT") then
            fixedAnim = anim:gsub("RIGHT", "LEFT")
        end
    end

    if bfOffsets[fixedAnim] ~= nil then
        setProperty("boyfriend.offset.x", bfOffsets[fixedAnim].x)
        setProperty("boyfriend.offset.y", bfOffsets[fixedAnim].y)
    end

    if bfOffsets[anim] ~= nil then
        local ox = bfOffsets[anim].x
        local oy = bfOffsets[anim].y

        if getProperty("boyfriend.flipX") then
            ox = -ox
        end

        setProperty("boyfriend.offset.x", ox)
        setProperty("boyfriend.offset.y", oy)
    end

    if Danger then
        if getProperty('healthBar.percent') < 40 then
            setProperty('iconP1.animation.curAnim.curFrame',1)
            setProperty('iconP2.animation.curAnim.curFrame',2)
            setProperty('testIcon.animation.curAnim.curFrame', 2);
        elseif getProperty('healthBar.percent') > 80 then
            setProperty('iconP1.animation.curAnim.curFrame',2)
            setProperty('iconP2.animation.curAnim.curFrame',1)
        else
            setProperty('iconP1.animation.curAnim.curFrame',0)
            setProperty('iconP2.animation.curAnim.curFrame',0)
            setProperty('testIcon.animation.curAnim.curFrame', 0);
        end
    end

    setProperty("testIcon.x", getProperty("healthBar.x") + 550)
    setProperty("testIcon.y", getProperty("healthBar.y") - 84)

    local pX, oX = getProperty('iconP1.x'), getProperty('iconP2.x')

    if curStep >= 1632 then
        Danger = false
        setProperty('iconP1.x', oX)
        setProperty('iconP2.x', pX)

        setProperty('iconP1.flipX', true)
        setProperty('iconP2.flipX', true)
        setProperty('healthBar.leftToRight', true)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if getProperty("boyfriend.flipX") then
        if direction == 0 then -- LEFT
            characterPlayAnim("boyfriend", "singRIGHT", true)
        elseif direction == 3 then -- RIGHT
            characterPlayAnim("boyfriend", "singLEFT", true)
        end
    else
        if direction == 0 then -- LEFT
            characterPlayAnim("boyfriend", "singLEFT", true)
        elseif direction == 3 then -- RIGHT
            characterPlayAnim("boyfriend", "singRIGHT", true)
        end
    end
end

function goodNoteHitPre(i)
     if getProperty('boyfriend.specialAnim') then
        setProperty('notes.members['..i..'].noAnimation', true)
    end
end

local function rgbToHex(t)
    return string.format('%02X%02X%02X', t[1], t[2], t[3])
end

function onSectionHit()
    if curSection == 56 then
        for i = 1,#dodgeStuff do
            doTweenAlpha(dodgeStuff[i]..'tween', dodgeStuff[i], 1, 0.5)
		end
    end

    if curSection == 57 then
        for i = 1,#dodgeStuff do
            doTweenAlpha(dodgeStuff[i]..'tween', dodgeStuff[i], 0, 0.5)
		end
    end
end

function onStepHit()
    if curStep == 907 then
        doTweenAlpha("HI", "testIcon", 1, 0.2, "linear")
        doTweenAlpha("HI2", "Dangerhealth", 1, 0.2, "linear")
        setProperty("gf.alpha", 1)
        if udodged then
            characterPlayAnim("boyfriend", "dodge", false)
            setProperty('boyfriend.specialAnim', true)
            doTweenX("BFX", "boyfriend", 260, 0.3, "cubeOut")
        end
        triggerEvent("Play Animation", "anime", "gf")
        setProperty("boyfriend.cameraPosition", {-100, 0})
        
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
            noteTweenAlpha("NoteFade1", 0, 0, 1, "cubeOut")
            noteTweenAlpha("NoteFade2", 1, 0, 1, "cubeOut")
            noteTweenAlpha("NoteFade3", 2, 0, 1, "cubeOut")
            noteTweenAlpha("NoteFade4", 3, 0, 1, "cubeOut")
        end
    end

    if curStep == 1632 then
        cameraShake("hud", 0.025, 0.35)
        callMethod('iconP2.changeIcon', {'killerpuppy'})
        setHealthBarColors(rgbToHex(getProperty('boyfriend.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
        setProperty("testIcon.alpha", 0)
        removeLuaSprite("Dangerhealth", true)
        Danger = false
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

function onTweenCompleted(tag)
    if tag == "BFX" then
        setProperty('boyfriend.specialAnim', false);
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

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == "GF Sing" or gfSection then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.015);
        end
    end
end