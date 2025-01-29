local dir = "bg/cafeteria/"
local bg = { -900, -200 }

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite("1", getBG("1"), bg[1], bg[2])

    makeLuaSprite("2", getBG("2"), bg[1], bg[2])

    makeLuaSprite("3", getBG("3"), bg[1], bg[2])

    makeLuaSprite("4", getBG("4"), bg[1], bg[2])
    setObjectOrder('4', 1)
    setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') + 2)
    setObjectOrder('4', getObjectOrder('dadGroup') - 1)

    makeLuaSprite("5", getBG("5"), bg[1], bg[2])
    setObjectOrder('5', getObjectOrder('dadGroup') - 1)

    addLuaSprite("1")
    addLuaSprite("2")
    addLuaSprite("3")
    addLuaSprite("4", true)
    addLuaSprite("5", true)
end