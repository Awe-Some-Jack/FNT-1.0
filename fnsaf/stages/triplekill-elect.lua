function onCreate()
    makeAnimatedLuaSprite('spark', "bg/triple/electrical/sparkle", -860, -200)
    addAnimationByPrefix('spark', 'idle', 'sparkle glowing0', 12, true)
    objectPlayAnimation('spark', 'idle', false)

    makeLuaSprite('bg', 'bg/triple/electrical/break-electrical', -900, -200)

    addLuaSprite('spark', false)
    addLuaSprite('bg', false)
end
