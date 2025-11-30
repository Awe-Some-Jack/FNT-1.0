local dir = "bg/collab/glitched/"
local bg = { -400, 250 }

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite("1", getBG("bg"), bg[1], bg[2])
    scaleObject("1", 1.8, 1.8)

    addLuaSprite("1")
end