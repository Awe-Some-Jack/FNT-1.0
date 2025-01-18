local dir = "bg/electrical/"
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

    addLuaSprite("1")
    addLuaSprite("2", true)
    addLuaSprite("3", true)
end