function onCreate()
    makeLuaSprite('wall', 'bg/triple/reactor/wall', -1200, -400)

    makeLuaSprite('floor', 'bg/triple/reactor/floor', -1200, 400)

    makeLuaSprite('parts', 'bg/triple/reactor/reac_parts', -1200, 500)

    makeLuaSprite('reactor', 'bg/triple/reactor/reactor', 350, -500)

    if not lowQuality then
        makeLuaSprite('wallydied', 'bg/triple/reactor/wally_head', 1660, 660)
        makeLuaSprite('drdied', 'bg/triple/reactor/drded', 1950, 580)
        makeLuaSprite('blood1', 'bg/triple/reactor/blood1', 2300, 930)
        makeLuaSprite('blood2', 'bg/triple/reactor/blood2', 1300, 1100)
        makeLuaSprite('blood3', 'bg/triple/reactor/blood_cherry', -50, 1100)
    end

    makeLuaSprite("overlay")
    makeGraphic("overlay", screenWidth, screenHeight, "0B0B33")
    setProperty("overlay.alpha", 0.2)
    setBlendMode("overlay", "multiply")
    setObjectCamera("overlay", "hud")
    addLuaSprite("overlay")

    addLuaSprite('wall', false)
    addLuaSprite('floor', false)
    addLuaSprite('parts', false)
    addLuaSprite('reactor', false)
    addLuaSprite('effects', false)

    addLuaSprite('wallydied', false)
    addLuaSprite('drdied', false)
    addLuaSprite('blood1', false)
    addLuaSprite('blood2', false)
    addLuaSprite('blood3', false)

    addLuaSprite('overlay', true)
end
