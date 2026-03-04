
function onCreate()
    makeLuaSprite('bg', 'bg/mirahq/bg', -500, 0)
    scaleObject("bg", 1.1, 1)
	
    makeLuaSprite('desk', 'bg/mirahq/desk', 480, 410)
    scaleObject('desk', 1.1, 1)

    makeLuaSprite('light', 'bg/mirahq/greenhouse/clouds2', -500, 0)
    scaleObject('light', 1.1, 1)

    addLuaSprite('bg', false)
    addLuaSprite('desk', false)
    addLuaSprite('light', false)
end