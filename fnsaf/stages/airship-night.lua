local dir = "bg/collab/bean edition/"

function getBG(file)
    return dir .. file
end

function onCreate()
	createInstance('sky', 'flixel.addons.display.FlxBackdrop', {nil,0x11})
    loadGraphic('sky', getBG("AirshipBackdrop"))
    setScrollFactor("sky", 0.5, 0.5)
    addInstance('sky')
    callMethod('sky.setPosition', {0, 0})
    setProperty('sky.velocity.x', -35)
	
	makeLuaSprite('moon', getBG("AirshipMoon"), 0, 0);
	setScrollFactor('moon', 0.9, 0.9);
	scaleObject('moon', 0.6, 0.6);
	
	makeLuaSprite('Ground', getBG("AirshipGround"), -650, 400);
	setScrollFactor('Ground', 0.9, 0.9);
	scaleObject('Ground', 0.7, 0.7);
	

	if not lowQuality then
		makeLuaSprite('clouds', getBG("AirshipClouds"), -650, 300);
		setScrollFactor('clouds', 0.5, 0.5);
		scaleObject('clouds', 0.7, 0.7);

		makeLuaSprite('overlay', getBG("AirshipOverlay"), -500, -300);
		scaleObject('overlay', 0.7, 0.7);
	end

	addLuaSprite('sky', false);
	addLuaSprite("moon", false)
	addLuaSprite('clouds', false);
	addLuaSprite('Ground', false);
	addLuaSprite("overlay", true)
end