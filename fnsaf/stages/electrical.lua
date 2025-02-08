local dir = "bg/electrical/"
local bg = { -900, -200 }

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite("1", getBG("1"), bg[1], bg[2])

    makeAnimatedLuaSprite('Wi-Fi',getBG("Wi-Fi"), -870, -200)
	addAnimationByPrefix('Wi-Fi','idle','wi-fi idle0' ,12 ,true)
	objectPlayAnimation('Wi-Fi','idle' ,false)

    makeAnimatedLuaSprite('Vent',getBG("melina_vent"), -820, 50)
	addAnimationByPrefix('Vent','idle','melina_vent 1' ,24 ,true)
    addAnimationByPrefix('Vent','what','melina_vent 2' ,24 ,true)
    addAnimationByPrefix('Vent','are u','melina_vent 3' ,24 ,true)
	objectPlayAnimation('Vent','idle' ,false)

    makeLuaSprite("2", getBG("2"), bg[1], bg[2])

    makeLuaSprite("3", getBG("3"), bg[1], bg[2])

    makeLuaSprite("shadow", getBG("shadow"), 0, 0)
    setObjectCamera("shadow", 'hud')

    addLuaSprite("1")
    addLuaSprite("Wi-Fi")
    addLuaSprite("Vent")
    addLuaSprite("2", true)
    addLuaSprite("3", true)
    addLuaSprite("shadow")
end