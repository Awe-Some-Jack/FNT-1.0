
function onCreate()
    makeLuaSprite('darksky', 'bg/mirahq/greenhouse/darksky', -860, -200)
    scaleObject("darksky", 1.1, 1.1)
	
    makeLuaSprite('clouds1', 'bg/mirahq/greenhouse/clouds1', -700, 0)
    setScrollFactor('clouds1', 0.5, 0.5)
    scaleObject('clouds1', 1.1, 1.1)

    makeLuaSprite('clouds2', 'bg/mirahq/greenhouse/clouds2', -700, 0)
    setScrollFactor('clouds2', 0.7, 0.7)
    scaleObject('clouds2', 1.1, 1.1)

    makeLuaSprite('clouds3', 'bg/mirahq/greenhouse/clouds3', -700, 0)
    setScrollFactor('clouds3', 0.8, 0.8)
    scaleObject('clouds3', 1.1, 1.1)

    makeLuaSprite('floor', 'bg/mirahq/greenhouse/floor', -860, -200)
    scaleObject('floor', 1.1, 1.1)

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
        makeLuaSprite('green-object1', 'bg/mirahq/greenhouse/object1', -850, -195)
        scaleObject('green-object1', 1.1, 1.1)

        makeLuaSprite('green-object2', 'bg/mirahq/greenhouse/object2', -370, -195)
        scaleObject('green-object2', 1.1, 1.1)

        makeLuaSprite('green-object3', 'bg/mirahq/greenhouse/object3', -860, 350)
        scaleObject('green-object3', 1.1, 1.1)

        makeLuaSprite('green-object4', 'bg/mirahq/greenhouse/object4', -860, -200)
        scaleObject('green-object4', 1.1, 1.1)

        makeLuaSprite('green-object5', 'bg/mirahq/greenhouse/object5', -860, 400)
        scaleObject('green-object5', 1.1, 1.1)

        makeLuaSprite('green-light', 'bg/mirahq/greenhouse/light', -860, -200)
        scaleObject('green-light', 1.1, 1.1)
	end

    addLuaSprite('darksky', false)
    addLuaSprite('clouds1', false)
    addLuaSprite('clouds2', false)
    addLuaSprite('clouds3', false)
    addLuaSprite('clouds4', false)
    addLuaSprite('floor', false)

    addLuaSprite('green-object1', false)
    addLuaSprite('green-object2', false)
    addLuaSprite('green-object3', false)
    addLuaSprite('green-object4', true)
    addLuaSprite('green-object5', true)

    addLuaSprite('green-light', true)
end