local dir = "bg/hall/"

function getBG(file)
    return dir .. file
end

function onCreate()
	makeLuaSprite('back1', getBG("1"), -100, 0)
	scaleObject("back1", 0.65, 0.65)

	makeLuaSprite('back1-1', getBG("1-1"), getProperty("back1.x"), getProperty("back1.y"))
	scaleObject("back1-1", 0.65, 0.65)

	makeLuaSprite('back2', getBG("2"))
	scaleObject("back2", 0.65, 0.65)

	makeLuaSprite('back2-1', getBG("2-1"))
	scaleObject("back2-1", 0.65, 0.65)

	makeLuaSprite('back3', getBG("3"))
	scaleObject("back3", 0.65, 0.65)

	makeLuaSprite('back3-1', getBG("3-1"))
	scaleObject("back3-1", 0.65, 0.65)

	makeLuaSprite('back4', getBG("4"))
	scaleObject("back4", 0.65, 0.65)

	makeLuaSprite('back4-1', getBG("4-1"))
	scaleObject("back4-1", 0.65, 0.65)

	makeLuaSprite('back4-2', getBG("4-2"))
	scaleObject("back4-2", 0.65, 0.65)

	makeLuaSprite('back5', getBG("5"))
	scaleObject("back5", 0.65, 0.65)

	makeLuaSprite('back5-1', getBG("5-1"))
	scaleObject("back5-1", 0.65, 0.65)

	makeLuaSprite('Door1', getBG("connect"))
	scaleObject("Door1", 0.65, 0.65)

	makeLuaSprite('Door2', getBG("connect"))
	scaleObject("Door2", 0.65, 0.65)

	makeLuaSprite('Door3', getBG("connect"))
	scaleObject("Door3", 0.65, 0.65)

	makeLuaSprite('Door4', getBG("connect"))
	scaleObject("Door4", 0.65, 0.65)

	makeLuaSprite('Door5', getBG("connect"))
	scaleObject("Door5", 0.65, 0.65)

	addLuaSprite('back1', false)
	addLuaSprite('back1-1', false)
	addLuaSprite('back2', false)
	addLuaSprite('back2-1', false)
	addLuaSprite('back3', false)
	addLuaSprite('back3-1', false)
	addLuaSprite('back4', false)
	addLuaSprite('back4-1', false)
	addLuaSprite('back4-2', false)
	addLuaSprite('back5', false)
	addLuaSprite('back5-1', false)

	addLuaSprite('Door1', false)
	addLuaSprite('Door2', false)
	addLuaSprite('Door3', false)
	addLuaSprite('Door4', false)
	addLuaSprite('Door5', false)

	setBlendMode("back1-1", "add")
	setBlendMode("back2-1", "add")
	setBlendMode("back3-1", "add")
	setBlendMode("back4-2", "add")
	setBlendMode("back5-1", "add")
end


function onUpdate(elapsed)
	setProperty("back1-1.x", getProperty("back1.x"))
	setProperty("back1-1.y", getProperty("back1.y"))

	setProperty("back2.x", getProperty("back1.x") - 1663)
	setProperty("back2.y", getProperty("back1.y"))
	setProperty("back2-1.x", getProperty("back2.x"))
	setProperty("back2-1.y", getProperty("back2.y"))

	setProperty("back3.x", getProperty("back2.x") - 2490)
	setProperty("back3.y", getProperty("back2.y"))
	setProperty("back3-1.x", getProperty("back3.x"))
	setProperty("back3-1.y", getProperty("back3.y"))

	setProperty("back4.x", getProperty("back3.x") - 1663)
	setProperty("back4.y", getProperty("back3.y"))
	setProperty("back4-1.x", getProperty("back4.x"))
	setProperty("back4-1.y", getProperty("back4.y"))
	setProperty("back4-2.x", getProperty("back4.x"))
	setProperty("back4-2.y", getProperty("back4.y"))

	setProperty("back5.x", getProperty("back4.x") - 2490)
	setProperty("back5.y", getProperty("back4.y"))
	setProperty("back5-1.x", getProperty("back5.x"))
	setProperty("back5-1.y", getProperty("back5.y"))

	setProperty("Door1.x", getProperty("back1.x") - 200)
	setProperty("Door1.y", getProperty("back1.y"))

	setProperty("Door2.x", getProperty("back2.x") - 200)
	setProperty("Door2.y", getProperty("back2.y"))

	setProperty("Door3.x", getProperty("back3.x") - 200)
	setProperty("Door3.y", getProperty("back3.y"))

	setProperty("Door4.x", getProperty("back4.x") + 1500)
	setProperty("Door4.y", getProperty("back4.y"))

	setProperty("Door5.x", getProperty("back4.x") - 200)
	setProperty("Door5.y", getProperty("back4.y"))
end