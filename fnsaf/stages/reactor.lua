local dir = "bg/reactor/low/"

function onCreate()
    local loc = { -1000, -580 }
    if not lowQuality then
        makeLuaSprite('1', 'bg/reactor/1', -750, -500)
	scaleObject('1', 2.3, 2.3)
	setProperty('1.alpha', 1)

	makeAnimatedLuaSprite('12','bg/reactor/12', -1000, 730);
    addAnimationByPrefix('12', 'idle', '12 idle' ,28, true)
	objectPlayAnimation('12', 'idle', true)
	setProperty('12.alpha', 1)
	scaleObject('12', 3, 3)

	makeAnimatedLuaSprite('13','bg/reactor/12', 800, 730);
    addAnimationByPrefix('13', 'idle', '12 idle' ,28, true)
	objectPlayAnimation('13', 'idle', true)
	setProperty('13.alpha', 1)
	scaleObject('13', 3, 3)

	makeAnimatedLuaSprite('14','bg/reactor/14', -1450, 160);
    addAnimationByPrefix('14', 'idle', '14 idle' ,28, true)
	objectPlayAnimation('14', 'idle', true)
	setProperty('14.alpha', 1)
	scaleObject('14', 3, 3)

	makeAnimatedLuaSprite('15','bg/reactor/15', 50, 160);
    addAnimationByPrefix('15', 'idle', '15 idle' ,28, true)
	objectPlayAnimation('15', 'idle', true)
	setProperty('15.alpha', 1)
	scaleObject('15', 3, 3)

	makeLuaSprite('2', 'bg/reactor/2', -750, -500)
	scaleObject('2', 2.3, 2.3)
	setProperty('2.alpha', 1)

	makeLuaSprite('3', 'bg/reactor/3', -750, -500)
	scaleObject('3', 2.3, 2.3)
	setProperty('3.alpha', 1)

	makeLuaSprite('4', 'bg/reactor/4', -750, -500)
	scaleObject('4', 2.3, 2.3)
	setProperty('4.alpha', 1)

	makeLuaSprite('5', 'bg/reactor/5', -750, -500)
	scaleObject('5', 2.3, 2.3)
	setProperty('5.alpha', 1)

	makeLuaSprite('6', 'bg/reactor/6', -750, -500)
	scaleObject('6', 2.3, 2.3)
	setProperty('6.alpha', 1)

	makeAnimatedLuaSprite('10','bg/reactor/10', -1110, -40);
    addAnimationByPrefix('10', 'idle', '10 idle' ,30, false)
    addAnimationByPrefix('10', 'idle2', '10 idle' ,24, false)
	objectPlayAnimation('10', 'idle', true)
	setProperty('10.alpha', 1)
	scaleObject('10', 3, 3)

	makeAnimatedLuaSprite('11','bg/reactor/11', -320, -40);
    addAnimationByPrefix('11', 'idle', '11 idle' ,30, false)
    addAnimationByPrefix('11', 'idle2', '11 idle' ,24, false)
	objectPlayAnimation('11', 'idle', true)
	setProperty('11.alpha', 1)
	scaleObject('11', 3, 3)

	--makeLuaSprite('6-1', 'bg/reactor/6-1', -750, -500)
	scaleObject('6'-1, 2.3, 2.3)
	setProperty('6-1.alpha', 1)

	makeLuaSprite('7', 'bg/reactor/7', -750, -500)
	scaleObject('7', 2.3, 2.3)
	setProperty('7.alpha', 0.7)

	makeLuaSprite('8', 'bg/reactor/8', -750, -500)
	scaleObject('8', 2.3, 2.3)
	setProperty('8.alpha', 0)

	makeLuaSprite('9', 'bg/reactor/9', -750, -500)
	scaleObject('9', 2.3, 2.3)
	setProperty('9.alpha', 0.7)

    addLuaSprite('1', false)
	addLuaSprite('2', false)
	setBlendMode('2', 'add')
	addLuaSprite('12', false)
	addLuaSprite('13', false)
	addLuaSprite('14', false)
	addLuaSprite('15', false)
	addLuaSprite('3', false)
	addLuaSprite('4', false)
	addLuaSprite('5', false)
	addLuaSprite('6', false)
	addLuaSprite('10', false)
	addLuaSprite('11', false)
	addLuaSprite('6-1', false)
	addLuaSprite('7', true)
	setBlendMode('7', 'add')
	addLuaSprite('8', true)
	addLuaSprite('9', true)
	setBlendMode('9', 'add')
    else
    for i = 1, 3 do
        local bgName = "bg" .. i
        makeLuaSprite(bgName, dir .. i, loc[1], loc[2])
        scaleObject(bgName, 2, 2)
        addLuaSprite(bgName)
        if i == 2 then
            setBlendMode(bgName, "add")
        end
    end
    setProperty("dad.x", -390)
    setProperty("dad.y", 370)

    setProperty("boyfriend.x", 500)
    setProperty("boyfriend.y", 380)
    end
end