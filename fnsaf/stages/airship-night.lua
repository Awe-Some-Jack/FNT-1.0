local dir = "bg/collab/bean edition/"

function getBG(file)
    return dir .. file
end

function onCreate()
	makeLuaSprite('sky', getBG("AirshipBackdrop"), -300, -100);
	setScrollFactor('sky', 0.2, 0.2);
	
	makeLuaSprite('moon', getBG("AirshipMoon"), 0, 0);
	setScrollFactor('moon', 0.4, 0.4);
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

	makeLuaSprite('darkoverlay', getBG("AirshipDarkOverlay"), 0, 0);
	setObjectCamera("darkoverlay", "hud")
	scaleObject('darkoverlay', 0.4, 0.5);

	addLuaSprite('sky', false)
	addLuaSprite("moon", false)
	addLuaSprite('clouds', false)
	addLuaSprite('Ground', false)
	addLuaSprite("overlay", true)
	addLuaSprite("darkoverlay", true)
end