local dir = "bg/reactor/"
local bg = { -1200, -400 }

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite("1", getBG("1"), bg[1], bg[2])

    makeLuaSprite("2", getBG("2"), bg[1], bg[2])

    makeLuaSprite("3", getBG("3"), bg[1], bg[2])

	makeLuaSprite("4", getBG("4"), bg[1], bg[2])

	makeLuaSprite("5", getBG("5"), bg[1], bg[2])

	makeLuaSprite("6", getBG("6"), bg[1], bg[2])

	makeLuaSprite("7", getBG("7"), bg[1], bg[2])

	makeLuaSprite("8", getBG("8"), bg[1], bg[2])

	makeLuaSprite("8", getBG("8"), bg[1], bg[2])

	makeLuaSprite("9", getBG("9"), bg[1], bg[2])

	makeLuaSprite("vig", getBG("vignette"))
	setObjectCamera("vig", "hud")

	addLuaSprite("1")
    addLuaSprite("2")
    addLuaSprite("3")
    addLuaSprite("4")
    addLuaSprite("5")
	addLuaSprite("6")
	addLuaSprite("7")
	addLuaSprite("8")
	addLuaSprite("9", true)
	addLuaSprite("vig", true)
end