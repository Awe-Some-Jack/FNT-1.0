local dir = "bg/zanta/"

function getBG(file)
    return dir .. file
end

function onCreate()
	makeLuaSprite('bg',getBG("bg"),-52.6,86.65)
	makeAnimatedLuaSprite('gate','bg/zanta/gate',1099.85,-3.7)
	addAnimationByIndices('gate','close','gate','0',24)
	addAnimationByIndices('gate','open','gate','1',24)
	objectPlayAnimation('gate','close')
	addLuaSprite('bg',false)





	makeAnimatedLuaSprite('who', getBG("who"),1230, -100)

	addAnimationByPrefix('who','idle','dark orange idle0',24,false)
	addAnimationByPrefix('who','alt','dark orange alt',24,false)
	addAnimationByPrefix('who','hurt','died',12,false)
	addAnimationByPrefix('who','bald','dark orange bald',24,false)
	addLuaSprite('who',false)
	scaleObject('who', 1.3, 1.3)
	objectPlayAnimation('who','idle')

	addLuaSprite('gate',false)

	makeAnimatedLuaSprite('banana',getBG("banana"), -270, -50)
	addAnimationByPrefix('banana','idle','banana idle', 24)
	addAnimationByPrefix('banana','dead','banana dead', 24, false)
	scaleObject('banana', 1.2, 1.2)
	addLuaSprite('banana',true)

	makeLuaSprite('bartop','',0,0)
	makeGraphic('bartop',1280,100,'000000')
	addLuaSprite('bartop',true)

	makeLuaSprite('barbot','',0,620)
	makeGraphic('barbot',1280,100,'000000')
	addLuaSprite('barbot',true)
	setScrollFactor('bartop',0,0)
	setScrollFactor('barbot',0,0)
	setObjectCamera('bartop','hud')
	setObjectCamera('barbot','hud')
end

function onEvent(event, value1, value2, strumTime)
	if event == "duet" then

	    duet = value1 == "true"

    end
end

function onCreatePost()
	
	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums',i,'visible',false)
		setPropertyFromGroup('opponentStrums',i,'y',130)
		setPropertyFromGroup('opponentStrums',i,'x',-9999)
	end


	--triggerEvent('Camera Follow Pos','900','360')
	setProperty('camFollow.y',360)
	setProperty('camFollow.x',900)
	setProperty('camPos.x',0)
	setProperty('camPos.y',0)
	setProperty('camGame.scroll.x',500)
	setProperty('camGame.scroll.y',0)


	

end

function onBeatHit()
	if duet then
			triggerEvent('Camera Follow Pos','1000','360')

	else
		if mustHitSection then
		
			triggerEvent('Camera Follow Pos','660','360')

		else
			triggerEvent('Camera Follow Pos','1350','360')

		end
	end

	setProperty('banana.y', -50+40)
	doTweenY('bananabounce','banana',-50,0.15,'circOut')
end