local dir = "bg/reactor/"

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite("1", getBG("1"), -1200, -400)

    makeLuaSprite("2", getBG("2"), -1200, 400)

    makeLuaSprite("3", getBG("3"), -1200, 500)

	makeLuaSprite("4", getBG("4"), 350, -500)

	makeLuaSprite("5", getBG("5"), getProperty("1.x") + 1000, getProperty("1.y"))
	setProperty("5.alpha", 0.2)
	setBlendMode("5", "add")

	makeLuaSprite("6", getBG("6"), getProperty("2.x") + 120, getProperty("2.y") + 480)
	setProperty("6.alpha", 0.2)
	setBlendMode("6", "add")

	makeLuaSprite("7", getBG("7"), getProperty("3.x") + 150, getProperty("3.y") - 30)
	setProperty("7.alpha", 0.2)
	setBlendMode("7", "add")

	makeLuaSprite("8", getBG("8"), getProperty("4.x") - 20, getProperty("4.y") + 310)
	setProperty("8.alpha", 0.2)
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

function onBeatHit()
	if curBeat %2 == 0 then
		setProperty("5.alpha", 1)
		setProperty("6.alpha", 1)
		setProperty("7.alpha", 1)
		setProperty("8.alpha", 1)

		doTweenAlpha("Beatobject1", "5", 0.2, 0.5)
		doTweenAlpha("Beatobject2", "6", 0.2, 0.5)
		doTweenAlpha("Beatobject3", "7", 0.2, 0.5)
		doTweenAlpha("Beatobject4", "8", 0.2, 0.5)
	end
end