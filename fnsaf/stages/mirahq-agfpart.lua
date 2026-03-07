
function onCreate()
    makeLuaSprite('back', 'bg/mirahq/agfpart/back', -561, -261)
	
    makeLuaSprite('door', 'bg/mirahq/agfpart/door', -568, -121)

    makeLuaSprite('chair', 'bg/mirahq/agfpart/chair', 1450, 605)

    makeLuaSprite('locker', 'bg/mirahq/agfpart/locker', 875, -10)

    makeLuaSprite('effects', 'bg/mirahq/agfpart/effects', -561, -261)

    makeLuaSprite('darkeffects', 'bg/mirahq/agfpart/e', -561, -261)

    makeLuaSprite('shadows', 'bg/mirahq/agfpart/shadows', -572, -261)

    addLuaSprite('back', false)
    addLuaSprite('door', false)
    addLuaSprite('chair', false)
    addLuaSprite('locker', false)
    addLuaSprite('effects', false)
    addLuaSprite('darkeffects', false)
    addLuaSprite('shadows', false)
end

function onStepHit()
    if curStep == 2664 then
        removeLuaSprite("shadows", true)
    end
end