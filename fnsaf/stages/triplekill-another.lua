function onCreate()
    makeLuaSprite('top', 'bg/triple/Phase1/top', 0, -350)

    makeLuaSprite('topdown', 'bg/triple/Phase1/topdown', 60, 600)

    addLuaSprite('top', false)
    addLuaSprite('topdown', false)

    setProperty("gf.visible", false)
end
