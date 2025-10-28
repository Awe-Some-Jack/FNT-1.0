local dir = "bg/cafeteria/"
local bg = { -650, -200 }

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite("1", getBG("1"), bg[1], bg[2])
    scaleObject("1", 0.7, 0.7)

    makeLuaSprite("2", getBG("2"), -290, 650)
    scaleObject("2", 0.7, 0.7)

    makeLuaSprite("3", getBG("3"), -500, 910)
    scaleObject("3", 0.7, 0.765)

    setObjectOrder('2', getObjectOrder("boyfriendGroup") + 1)
    setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') + 2)
    setObjectOrder('3', getObjectOrder('dadGroup') - 1)

    makeAnimatedLuaSprite("melina", "bg/cafeteria/melina", 90, 580)
    addAnimationByPrefix("melina", "idle", "melina", 24, false)
    scaleObject("melina", 0.8, 0.8)

    makeAnimatedLuaSprite("loyalblue", "bg/cafeteria/troublue", 510, 750)
    addAnimationByPrefix("loyalblue", "idle", "Blue", 24, false)
    scaleObject("loyalblue", 0.8, 0.8)

    makeAnimatedLuaSprite("pink", "bg/cafeteria/dcpink", 910, 550)
    addAnimationByPrefix("pink", "idle", "dcpink", 24, false)
    scaleObject("pink", 0.8, 0.8)

    makeLuaSprite("4", getBG("4"), bg[1], bg[2])
    scaleObject("4", 0.7, 0.7)

    addLuaSprite("1")
    addLuaSprite("2")
    addLuaSprite("3")
    addLuaSprite("melina", true)
    addLuaSprite("pink", true)
    addLuaSprite("loyalblue", true)
    addLuaSprite("4", true)
end

beanStuff = {'melina', 'loyalblue', 'pink'}

function onUpdate(elapsed)
    if not mustHitSection then
        for i = 1,#beanStuff do
			doTweenAlpha(beanStuff[i]..'tween', beanStuff[i], 1, 0.2)
		end

        triggerEvent("Tween Cam Zoom", "0.9", "")
    else
        for i = 1,#beanStuff do
			doTweenAlpha(beanStuff[i]..'tween', beanStuff[i], 0, 0.2)
		end

        triggerEvent("Tween Cam Zoom", "1.1", "")
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim("melina", "idle", true)
        playAnim("loyalblue", "idle", true)
        playAnim("pink", "idle", true)
    end
end
