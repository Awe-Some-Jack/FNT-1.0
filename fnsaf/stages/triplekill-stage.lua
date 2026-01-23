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
            'bg/triple/electrical/sparkle',
            'bg/triple/Phase2/dark_bg',
            'bg/triple/Phase2/top_2',
            'bg/triple/Phase2/topdown_2',
            'bg/triple/Finale/dark_bg2',
            'bg/triple/Finale/top_3',
            'bg/triple/Finale/topdown_3',
            'bg/triple/Finale/final_object',
            'bg/triple/Finale/final_object2',
            'bg/triple/Finale/final_object3',
            'bg/triple/Finale/topdown_object',
            'bg/triple/Finale/topdown_object2',
            'bg/triple/Finale/top_alt',
            'bg/triple/Finale/top_alt_center',
            'bg/triple/Finale/final_star',}
characterArray = {'bf',
                'bf-triplekill-center',
				'puppy-evil',
                'wally-exe',
				'agf-exe',
                'blist'}
currentStage = ""

function onCreatePost()
    thePrecacher(imageArray, characterArray)	
    stageLoader('crash-reactor')
   
end

function onBeatHit()

	if curBeat == 260 then 
		stageLoader('another')
	end

    if curBeat == 324 then
        stageLoader('crash-ship')
    end

    if curBeat == 612 then 
		stageLoader('another2')
	end

    if curBeat == 740 then 
		stageLoader('crash-elect')
	end

    if curBeat == 1060 then 
		stageLoader('another3')
	end

end

function stageLoader(stageName, tags)
    currentStage = stageName
	if stageName == 'crash-reactor' then

        replaceStageParts('wall', imageArray[1], -1200, -400, 1, 1, 1, 1, false)
        replaceStageParts('floor', imageArray[2], -1200, 400, 1, 1, 1, 1, false)
        replaceStageParts('parts', imageArray[3], -1200, 500, 1, 1, 1, 1, false)
        replaceStageParts('reactor', imageArray[4], 350, -500, 1, 1, 1, 1, false)
        if not lowQuality then
            replaceStageParts('wallydied', imageArray[5], 1660, 660, 1, 1, 1, 1, false)
            replaceStageParts('drdied', imageArray[6], 1950, 580, 1, 1, 1, 1, false)
            replaceStageParts('blood1', imageArray[7], 2300, 930, 1, 1, 1, 1, false)
            replaceStageParts('blood2', imageArray[8], 1300, 1100, 1, 1, 1, 1, false)
            replaceStageParts('blood3', imageArray[9], -50, 1100, 1, 1, 1, 1, false)
        end
        replaceStageParts('effects', imageArray[10], -1200, -400, 1, 1, 1, 1, false)

        makeLuaSprite("overlay")
        makeGraphic("overlay", screenWidth, screenHeight, "0B0B33")
        setProperty("overlay.alpha", 0.2)
        setBlendMode("overlay", "multiply")
        setObjectCamera("overlay", "hud")
        addLuaSprite("overlay")

    elseif stageName == 'crash-ship' then
        ----another1 stuff
        removeLuaSprite('top', true)
        removeLuaSprite('topdown', true)

        setCameraScroll(500, 500)

        moveTheCharacter(300, 0, -300, -20)

        replaceStageParts('shipbg', imageArray[13], -900, -300, 1, 1, 1.2, 1.2, false)
        replaceStageParts('object', imageArray[14], -250, 400, 1, 1, 1.2, 1.2, false)
        replaceStageParts('wire', imageArray[16], -900, -300, 1, 1, 1.2, 1.2, true)
        replaceStageParts('dedbean', imageArray[17], -800, 500, 0.9, 0.9, 1.2, 1.2, true)
        replaceStageParts('shiplight', imageArray[15], -880, -300, 1, 1, 1.2, 1.2, true)

    elseif stageName == 'crash-elect' then 
        ----another2 stuff
        removeLuaSprite('darkbg', true)
        removeLuaSprite('top2', true)
        removeLuaSprite('topdown2', true)

        setCameraScroll(500, 500)

        moveTheCharacter(970, 0, -150, 0)

        replaceStageParts('spark', imageArray[19], -860, -200, 1, 1, 1, 1, false, 'animated', 'sparkle glowing0', 12, true)
        replaceStageParts('bg',imageArray[18], -900, -200, 1, 1, 1, 1, false)

    elseif stageName == 'another3' then 
        ----elect stuff
        removeLuaSprite('spark', true)
        removeLuaSprite('bg', true)

        setCameraScroll(500, 500)

        moveTheCharacter(150, 0, 160, -1500)

        replaceStageParts('darkbg3', imageArray[23], -2100, -1900, 1, 1, 1, 1, false)
        replaceStageParts('finalstar', imageArray[33], -1100, -1900, 1, 1, 1, 1, false)
        replaceStageParts('top3', imageArray[24], -380, -1000, 1, 1, 1, 1, false)
        replaceStageParts('top3_alt',imageArray[31], 680, -300, 1, 1, 1, 1, false)
        replaceStageParts('top3_alt2',imageArray[31], 0, 0, 1, 1, 1, 1, false, "flipped")
        replaceStageParts('top3_center',imageArray[32], 0, 0, 1, 1, 1, 1, false)
        replaceStageParts('topdownob',imageArray[29], -1000, 580, 1, 1, 1, 1, false)
        replaceStageParts('topdown3',imageArray[25], -100, 620, 1, 1, 1, 1, false)
        replaceStageParts('topdownob2',imageArray[30], -1330, 250, 1, 1, 1, 1, false)
        if not lowQuality then
            replaceStageParts('finalob',imageArray[26], -2100, -1900, 1, 1, 1, 1, true)
            replaceStageParts('finalob2',imageArray[27], -2100, -700, 1, 1, 1, 1, true)
            replaceStageParts('finalob3',imageArray[28], 1700, -1000, 1, 1, 1, 1, true)
        end

    elseif stageName == 'another2' then 
        ----ship stuff
        removeLuaSprite('shipbg', true)
        removeLuaSprite('object', true)
        removeLuaSprite('wire', true)
        removeLuaSprite('dedbean', true)
        removeLuaSprite('shiplight', true)

        setCameraScroll(500, 500)

        moveTheCharacter(150, 0, 160, -1000)

        replaceStageParts('darkbg', imageArray[20], -2100, -1900, 1, 1, 1, 1, false)
        replaceStageParts('top2', imageArray[21], 0, -350, 1, 1, 1, 1, false)
        replaceStageParts('topdown2',imageArray[22], 60, 600, 1, 1, 1, 1, false)

    elseif stageName == 'another' then 
        ----reactor stuff
        removeLuaSprite('wall', true)
        removeLuaSprite('floor', true)
        removeLuaSprite('parts', true)
        removeLuaSprite('reactor', true)
        removeLuaSprite('wallydied', true)
        removeLuaSprite('drdied', true)
        removeLuaSprite('blood1', true)
        removeLuaSprite('blood2', true)
        removeLuaSprite('blood3', true)
        removeLuaSprite('effects', true)

        setCameraScroll(500, 500)

        moveTheCharacter(150, 0, 160, -1000)

        replaceStageParts('top', imageArray[11], 0, -350, 1, 1, 1, 1, false)
        replaceStageParts('topdown',imageArray[12], 60, 600, 1, 1, 1, 1, false)
	
	else -- called if the stage cant be found
		debugPrint(stageName .. ' couldnt be found')
	end
end

function onUpdate(elapsed)
    setProperty("top3_alt2.x", getProperty("spexe-final.x") - 150)
    setProperty("top3_alt2.y", getProperty("spexe-final.y") + 370)

    setProperty("top3_alt.x", getProperty("wallyexe-final.x") + 70)
    setProperty("top3_alt.y", getProperty("wallyexe-final.y") + 440)

    setProperty("top3_center.x", getProperty("agfexe-final.x") + 80)
    setProperty("top3_center.y", getProperty("agfexe-final.y") + 580)
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