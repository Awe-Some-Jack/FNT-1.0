local dir = "bg/engine-room/"
local bg = { -900, -200 }

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite("1", getBG("1"), bg[1], bg[2])
    scaleObject("1", 1.1, 1.1)

    makeLuaSprite("2", getBG("2"), bg[1], bg[2])
    scaleObject("2", 1.1, 1.1)

    makeLuaSprite("3", getBG("3"), bg[1], bg[2])
    scaleObject("3", 1.1, 1.1)

    makeLuaSprite("4", getBG("4"), bg[1], bg[2])
    scaleObject("4", 1.1, 1.1)

    makeLuaSprite("5", getBG("5"), bg[1], bg[2])
    scaleObject("5", 1.1, 1.1)

    makeLuaSprite("6", getBG("6"), bg[1], bg[2])
    scaleObject("6", 1.1, 1.1)

    makeLuaSprite("7", getBG("7"), bg[1], bg[2])
    scaleObject("7", 1.1, 1.1)

    addLuaSprite("1")
    addLuaSprite("2")
    addLuaSprite("3")
    addLuaSprite("4")
    addLuaSprite("5")
    addLuaSprite("6", true)
    addLuaSprite("7", true)
end