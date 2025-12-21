imageArray = {'bg/triple/reactor/wall',
            'bg/triple/reactor/floor',
            'bg/triple/reactor/reac_parts',
            'bg/triple/reactor/reactor',
            'bg/triple/reactor/wally_head',
            'bg/triple/reactor/drded',
            'bg/triple/reactor/blood1',
            'bg/triple/reactor/blood2',
            'bg/triple/reactor/blood_cherry',
            'bg/triple/reactor/effects',
            'bg/triple/Phase1/top',
            'bg/triple/Phase1/topdown',
            'bg/triple/ship/bg',
            'bg/triple/ship/object-ded',
            'bg/triple/ship/light',
            'bg/triple/ship/wire',
            'bg/triple/ship/deadbody-ship',
            'bg/triple/electrical/break-electrical',
            'bg/triple/electrical/sparkle',}
characterArray = {'bf',
				'puppy-evil',
				'agf-exe',
                'blist'}
currentStage = ""

function onCreatePost()
    thePrecacher(imageArray, characterArray)	
    stageLoader('crash-reactor')
   
end

function onBeatHit()

	if curBeat == 260 then 
		
	end

    if curBeat == 324 then
        stageLoader('crash-ship')
    end

    if curBeat == 740 then 
		stageLoader('crash-elect')
	end

end

function stageLoader(stageName, tags)
    currentStage = stageName
	if stageName == 'crash-reactor' then
        ----laboratory stuff
        removeLuaSprite('bg')
        removeLuaSprite('desk')
        removeLuaSprite('light')

         ----ship stuff
        removeLuaSprite('shipbg')
        removeLuaSprite('object')
        removeLuaSprite('wire')
        removeLuaSprite('dedbean')
        removeLuaSprite('shiplight')

        replaceStageParts('wall', imageArray[1], -1200, -400, 1, 1, 1, 1, false)
        replaceStageParts('floor', imageArray[2], -1200, 400, 1, 1, 1, 1, false)
        replaceStageParts('parts', imageArray[3], -1200, 500, 1, 1, 1, 1, false)
        replaceStageParts('reactor', imageArray[4], 350, -500, 1, 1, 1, 1, false)
        replaceStageParts('wallydied', imageArray[5], 1660, 660, 1, 1, 1, 1, false)
        replaceStageParts('drdied', imageArray[6], 1950, 580, 1, 1, 1, 1, false)
        replaceStageParts('blood1', imageArray[7], 2300, 930, 1, 1, 1, 1, false)
        replaceStageParts('blood2', imageArray[8], 1300, 1100, 1, 1, 1, 1, false)
        replaceStageParts('blood3', imageArray[9], -50, 1100, 1, 1, 1, 1, false)
        replaceStageParts('effects', imageArray[10], -1200, -400, 1, 1, 1, 1, false)

        makeLuaSprite("overlay")
        makeGraphic("overlay", screenWidth, screenHeight, "0B0B33")
        setProperty("overlay.alpha", 0.2)
        setBlendMode("overlay", "multiply")
        setObjectCamera("overlay", "hud")
        addLuaSprite("overlay")

    elseif stageName == 'crash-ship' then
        ----reactor stuff
        removeLuaSprite('wall')
        removeLuaSprite('floor')
        removeLuaSprite('parts')
        removeLuaSprite('reactor')
        removeLuaSprite('wallydied')
        removeLuaSprite('drdied')
        removeLuaSprite('blood1')
        removeLuaSprite('blood2')
        removeLuaSprite('blood3')
        removeLuaSprite('effects')

        setCameraScroll(500, 500)

        moveTheCharacter(300, 0, -300, -20)

        replaceStageParts('shipbg', imageArray[13], -900, -300, 1, 1, 1.2, 1.2, false)
        replaceStageParts('object', imageArray[14], -250, 400, 1, 1, 1.2, 1.2, false)
        replaceStageParts('wire', imageArray[16], -900, -300, 1, 1, 1.2, 1.2, true)
        replaceStageParts('dedbean', imageArray[17], -800, 500, 0.9, 0.9, 1.2, 1.2, true)
        replaceStageParts('shiplight', imageArray[15], -880, -300, 1, 1, 1.2, 1.2, true)

        makeLuaSprite("overlay")
        makeGraphic("overlay", screenWidth, screenHeight, "0B0B33")
        setProperty("overlay.alpha", 0.2)
        setBlendMode("overlay", "multiply")
        setObjectCamera("overlay", "hud")
        addLuaSprite("overlay")

    elseif stageName == 'crash-elect' then 
        ----reactor stuff
        removeLuaSprite('wall')
        removeLuaSprite('floor')
        removeLuaSprite('parts')
        removeLuaSprite('reactor')
        removeLuaSprite('wallydied')
        removeLuaSprite('drdied')
        removeLuaSprite('blood1')
        removeLuaSprite('blood2')
        removeLuaSprite('blood3')
        removeLuaSprite('effects')

         ----ship stuff
        removeLuaSprite('shipbg')
        removeLuaSprite('object')
        removeLuaSprite('wire')
        removeLuaSprite('dedbean')
        removeLuaSprite('shiplight')

        setCameraScroll(500, 500)

        moveTheCharacter(970, 0, -150, 0)

        replaceStageParts('spark', imageArray[19], -860, -200, 1, 1, 1, 1, false, 'animated', 'sparkle glowing0', 12, true)
        replaceStageParts('bg',imageArray[18], -900, -200, 1, 1, 1, 1, false);
	
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

function thePrecacher(images, characters) --loads all the sprites and characters so the game doesn't lag
	for i = 1, #images do
		precacheImage(images[i])
		--debugPrint(images[i].. ' has been precached')
	end
	for i = 1, #characters do
		addCharacterToList(characters[i])
		--debugPrint(characters[i].. ' has been precached')
		
		
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