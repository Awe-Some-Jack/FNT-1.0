
function onCreate()
    makeAnimatedLuaSprite('glitchbg', "bg/mirahq/whatwrongBG", -500, -500)
    addAnimationByPrefix('glitchbg', 'idle', 'what', 24, true)
    objectPlayAnimation('glitchbg', 'idle', false)
    scaleObject("glitchbg", 3.0, 3.0)

    addLuaSprite('glitchbg', false)
end