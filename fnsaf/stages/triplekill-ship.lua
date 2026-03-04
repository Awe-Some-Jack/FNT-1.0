function onCreate()
    makeLuaSprite('shipbg', 'bg/triple/ship/bg', -900, -300)
    scaleObject('shipbg', 1.2, 1.2)

    makeLuaSprite('object', 'bg/triple/ship/object-ded', -250, 400)
    scaleObject('object', 1.2, 1.2)

    makeLuaSprite('wire', 'bg/triple/ship/wire', -900, -300)
    scaleObject('wire', 1.2, 1.2)

    if not lowQuality then
        makeLuaSprite('dedbean', 'bg/triple/ship/deadbody-ship', -800, 500)
        setScrollFactor("dedbean", 0.9, 0.9)
        scaleObject('dedbean', 1.2, 1.2)

        makeLuaSprite('shiplight', 'bg/triple/ship/light', -880, -300)
        scaleObject('shiplight', 1.2, 1.2)
    end

    addLuaSprite('shipbg', false)
    addLuaSprite('object', false)
    addLuaSprite('wire', true)
    addLuaSprite('dedbean', true)
    addLuaSprite('shiplight', true)
end
