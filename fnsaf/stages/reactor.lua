local dir = "bg/reactor/"

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite("1", getBG("1"), -1200, -400)

    makeLuaSprite("2", getBG("2"), -1200, 400)

    makeLuaSprite("3", getBG("3"), -1200, 500)

	makeLuaSprite("4", getBG("4"), 350, -500)

	makeLuaSprite("5", getBG("5"), -1200, -400)
	setBlendMode("5", "add")

	makeLuaSprite("6", getBG("6"), getProperty("2.x") + 120, getProperty("2.y") + 480)
	setBlendMode("6", "add")

	makeLuaSprite("7", getBG("7"), getProperty("3.x") + 150, getProperty("3.y") - 30)
	setBlendMode("7", "add")

	makeLuaSprite("8", getBG("8"), getProperty("4.x") - 20, getProperty("4.y") + 310)
	setBlendMode("8", "add")

	makeLuaSprite("9", getBG("9"), -1200, -400)

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