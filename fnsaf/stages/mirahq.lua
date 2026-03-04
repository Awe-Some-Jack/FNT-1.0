imageArray = {'bg/mirahq/bg',
    'bg/mirahq/desk',
    'bg/mirahq/light',
    'bg/mirahq/hall',
    'bg/mirahq/agfpart/back',
    'bg/mirahq/agfpart/door',
    'bg/mirahq/agfpart/chair',
    'bg/mirahq/agfpart/locker',
    'bg/mirahq/agfpart/effctes',
    'bg/mirahq/agfpart/shadows',
    'bg/mirahq/agfpart/e',
    'bg/mirahq/greenhouse/darksky',
    'bg/mirahq/greenhouse/clouds1',
    'bg/mirahq/greenhouse/clouds2',
    'bg/mirahq/greenhouse/clouds3',
    'bg/mirahq/greenhouse/floor',
    'bg/mirahq/greenhouse/object1',
    'bg/mirahq/greenhouse/object2',
    'bg/mirahq/greenhouse/object3',
    'bg/mirahq/greenhouse/object4',
    'bg/mirahq/greenhouse/object5',
    'bg/mirahq/greenhouse/light',}
currentStage = ""

function onCreatePost()
    thePrecacher(imageArray)	
    stageLoader('laboratory')
   
end

function onBeatHit()

    if curBeat == 272 then
        stageLoader('darkhall')
    end
    
    if curBeat == 464 then
        stageLoader('dark')
    end

    if curBeat == 604 then
        stageLoader('agfpart')
    end

    if curBeat == 666 then
        removeLuaSprite("shadows", true)
    end

    if curBeat == 796 then
        stageLoader('videostage')
    end

    if curBeat == 836 then
        stageLoader('laboratory')
    end

    if curBeat == 968 then
        stageLoader('greenroom')
    end

    if curBeat == 1164 then
        stageLoader('laboratory')

        removeLuaSprite("darksky", true)
        removeLuaSprite("clouds1", true)
        removeLuaSprite("clouds2", true)
        removeLuaSprite("clouds3", true)
        removeLuaSprite("floor", true)
        removeLuaSprite("green-object1", true)
        removeLuaSprite("green-object2", true)
        removeLuaSprite("green-object3", true)
        removeLuaSprite("green-object4", true)
        removeLuaSprite("green-object5", true)
        removeLuaSprite("green-light", true)
    end

    if curBeat == 1913 then
        stageLoader('transStage')
    end

end

function stageLoader(stageName, tags)
    currentStage = stageName
	if stageName == 'laboratory' then

        replaceStageParts('la-bg', imageArray[1], -500, 0, 1, 1, 1.1, 1, false)
        replaceStageParts('desk', imageArray[2], 480, 410, 1, 1, 1.1, 1, false)
        replaceStageParts('la-light', imageArray[3], -500, 0, 1, 1, 1.1, 1, false)

        moveTheCharacter(720, 150, -50, 150)

    elseif stageName == 'darkhall' then
        removeLuaSprite('la-bg')
        removeLuaSprite('desk')
        removeLuaSprite('la-light')

        setCameraScroll(200, 300)

        moveTheCharacter(430, 170, -400, -230)

        replaceStageParts('hall', imageArray[4], -800, -200, 1, 1, 0.4, 0.4, false)
    elseif stageName == 'dark' then
        removeLuaSprite('hall')

        setCameraScroll(300, -300)

        moveTheCharacter(0, 200, 0, -400)

    elseif stageName == 'agfpart' then

        replaceStageParts('agf-back', imageArray[5], -561, -261, 1, 1, 1, 1, false)
        replaceStageParts('door', imageArray[6], -568, -121, 1, 1, 1, 1, false)
        replaceStageParts('chair', imageArray[7], 1450, 605, 1, 1, 1, 1, false)
        replaceStageParts('locker', imageArray[8], 875, -10, 1, 1, 1, 1, false)
        replaceStageParts('effects', imageArray[9], -561, -261, 1, 1, 1, 1, false)
        replaceStageParts('darkeffect', imageArray[11], -561, -261, 1, 1, 1, 1, false)
        replaceStageParts('shadows', imageArray[10], -572, -261, 1, 1, 1, 1, false)

        moveTheCharacter(930, 100, 100, 100)

    elseif stageName == 'videostage' then

        removeLuaSprite("agf-back", true)
        removeLuaSprite("door", true)
        removeLuaSprite("chair", true)
        removeLuaSprite("locker", true)
        removeLuaSprite("effects", true)
        removeLuaSprite("darkeffect", true)

        triggerEvent("Tween Cam Zoom", "0.4", "0.001")

    elseif stageName == 'greenroom' then 
        removeLuaSprite('la-bg')
        removeLuaSprite('desk')
        removeLuaSprite('la-light')

        setCameraScroll(300, -300)

        moveTheCharacter(400, 0, -400, 0)

        replaceStageParts('darksky', imageArray[12], -860, -200, 1, 1, 1.1, 1.1, false)
		replaceStageParts('clouds1', imageArray[13], -700, 0, 0.5, 0.5, 1.1, 1.1, false)
		replaceStageParts('clouds2', imageArray[14], -700, 0, 0.7, 0.7, 1.1, 1.1, false)
		replaceStageParts('clouds3', imageArray[15], -700, 0, 0.8, 0.8, 1.1, 1.1, false)
        replaceStageParts('floor',imageArray[16], -860, -200, 1, 1, 1.1, 1.1, false)
        if not lowQuality then
            replaceStageParts('green-object1', imageArray[17], -850, -195, 1, 1, 1.1, 1.1, false)
            replaceStageParts('green-object2', imageArray[18], -370, -195, 1, 1, 1.1, 1.1, false)
            replaceStageParts('green-object3', imageArray[19], -860, 350, 1, 1, 1.1, 1.1, false)
            replaceStageParts('green-object4', imageArray[20], -860, -200, 1, 1, 1.1, 1.1, true)
            replaceStageParts('green-object5', imageArray[21], -860, -200, 1, 1, 1.1, 1.1, true)
            replaceStageParts('green-light', imageArray[22], -860, -200, 1, 1, 1.1, 1.1, true)
        end
    elseif stageName == 'transStage' then
        removeLuaSprite('la-bg', true)
        removeLuaSprite('desk', true)
        removeLuaSprite('la-light', true)

        moveTheCharacter(500, 500, 700, 450)
	else -- called if the stage cant be found
		debugPrint(stageName .. ' couldnt be found')
	end
end

function replaceStageParts(key, file, posX, posY, scrollX, scrollY, scaleX, scaleY, isOnTop, tags, tags2, frameRate, doesLoop) --loads and replaces individual parts of a stage
	removeLuaSprite(key)
	if tags == 'animated' then
		makeAnimatedLuaSprite(key, file, posX, posY)
		setScrollFactor(key, scrollX, scrollY);
		scaleObject(key, scaleX, scaleY);
		addAnimationByPrefix(key, tags2, tags2, frameRate, doesLoop)
		addLuaSprite(key, isOnTop)
	
	else 
		makeLuaSprite(key, file, posX, posY);
		setScrollFactor(key, scrollX, scrollY);
		scaleObject(key, scaleX, scaleY);
		if tags == 'invis' then
			setProperty((key .. ".visible"), false);
		end
        if tags == 'flipped' then 
            setProperty(key .. '.flipX', true) 
        end
        if tags == 'center' then 
            screenCenter(key)
        end
		addLuaSprite(key, isOnTop);
	end
end

function thePrecacher(images) --loads all the sprites and characters so the game doesn't lag
	for i = 1, #images do
		precacheImage(images[i])
		--debugPrint(images[i].. ' has been precached')
	end
end

function setNewCameraVals(bfX, bfY, dadX, dadY, gfX, gfY, zoom)
    setProperty('boyfriend.cameraPosition.x', bfX)
    setProperty('boyfriend.cameraPosition.y', bfY)
    setProperty('dad.cameraPosition.x', dadX)
    setProperty('dad.cameraPosition.y', dadY)
    setProperty('defaultCamZoom', zoom)
end
function moveTheCharacter(bfX, bfY, dadX, dadY, gfX, gfY)
    setCharacterX('boyfriend', bfX)
    setCharacterY('boyfriend', bfY)
    setCharacterX('dad', dadX)
    setCharacterY('dad', dadY)
    setCharacterX('gf', gfX)
    setCharacterY('gf', gfY)
end