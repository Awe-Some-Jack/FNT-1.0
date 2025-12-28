local dir = "bg/mirahq/"

function getBG(file)
    return dir .. file
end

function onCreate()
	-- background shit
	makeLuaSprite('bg', getBG("bg"), -500, 0)
	scaleObject('bg', 1.1, 1.0)
	
	makeLuaSprite('desk', getBG("desk"), 480, 410)
	scaleObject('desk', 1.1, 1.0)

	makeLuaSprite('light', getBG("light"), -500, 0)
	scaleObject('light', 1.1, 1.0)

	addLuaSprite('bg', false)
	addLuaSprite('desk', false)
	addLuaSprite('light', true)
end