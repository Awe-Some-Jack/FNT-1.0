-- Shadow colors (RGB Normalized)
local shadowColorBF = {1, 1, 1}
local shadowColorGF = {1, 1, 1}
local shadowColorDAD = {1, 1, 1}

-- Adjustcolor values(Lighting)
local hueBF = 10
local saturationBF = 25
local contrastBF = -35
local brightnessBF = -100

local hueGF = -46
local saturationGF = -20
local contrastGF = -25
local brightnessGF = -46

local hueDAD = 10
local saturationDAD = 25
local contrastDAD = -35
local brightnessDAD = -100

-- Shadow intensity 
local distanceBF = 30
local distanceGF = 10
local distanceDAD = 15

-- Shadow angles (Position of the shadow)
local shadowAngleBF = 100
local shadowAngleGF = 75
local shadowAngleDAD = 70

-- Abot System Characters(You need the Hx scripts in the characters folder)
local gfAdjustFirstList = {'nene', 'nene-christmas'}

-- Don't touch anything down here!! Only if you know what you're doing

function isGFAdjustFirst(charName)
	for _, name in ipairs(gfAdjustFirstList) do
		if name == charName then return true end
	end
	return false
end

function onCreatePost()
	if not shadersEnabled then return end

	initLuaShader('dropShadow')
	initLuaShader('adjustColor')

	runHaxeCode([[
		import flixel.math.FlxAngle;
		function setShaderFrameInfo(objectName:String) {
			var object = switch (objectName) {
				case 'boyfriend': game.boyfriend;
				case 'dad': game.dad;
				case 'gf': game.gf;
				default: game.getLuaObject(objectName);
			}
			var originalCallback = object.animation.callback;
			object.animation.callback = function(name, frameNumber, frameIndex) {
				if (object.shader != null && object.frame != null) {
					object.shader.setFloatArray('uFrameBounds', [
						object.frame.uv.x, object.frame.uv.y,
						object.frame.uv.width, object.frame.uv.height
					]);
					object.shader.setFloat('angOffset', object.frame.angle * FlxAngle.TO_RAD);
				}
				if (originalCallback != null) originalCallback(name, frameNumber, frameIndex);
			}
		}
	]])

	applyShaderIfVisible('boyfriend', hueBF, saturationBF, contrastBF, brightnessBF, shadowAngleBF, distanceBF, shadowColorBF)
	applyShaderIfVisible('dad', hueDAD, saturationDAD, contrastDAD, brightnessDAD, shadowAngleDAD, distanceDAD, shadowColorDAD)

	local gfChar = getProperty('gf.curCharacter')
	if getProperty('gf.visible') then
		if isGFAdjustFirst(gfChar) then
			applyAdjustColor('gf', hueGF, saturationGF, contrastGF, brightnessGF)
		else
			applyDropShadow('gf', hueGF, saturationGF, contrastGF, brightnessGF, shadowAngleGF, distanceGF, shadowColorGF)
		end
	end
end

function applyShaderIfVisible(name, hue, sat, cont, bright, ang, dist, col)
	if getProperty(name .. '.visible') then
		applyDropShadow(name, hue, sat, cont, bright, ang, dist, col)
	end
end

function applyDropShadow(object, hue, saturation, contrast, brightness, shadowAngle, distance, shadowColor)
	setSpriteShader(object, 'dropShadow')

	setShaderFloat(object, 'hue', hue)
	setShaderFloat(object, 'saturation', saturation)
	setShaderFloat(object, 'contrast', contrast)
	setShaderFloat(object, 'brightness', brightness)
	setShaderFloat(object, 'ang', math.rad(shadowAngle))
	setShaderFloat(object, 'str', 1)
	setShaderFloat(object, 'dist', distance)
	setShaderFloat(object, 'thr', 0.1)
	setShaderFloat(object, 'AA_STAGES', 2)
	setShaderFloatArray(object, 'dropColor', shadowColor)

	runHaxeFunction('setShaderFrameInfo', {object})
end

function applyAdjustColor(object, hue, saturation, contrast, brightness)
	setSpriteShader(object, 'adjustColor')
	setShaderFloat(object, 'hue', hue)
	setShaderFloat(object, 'saturation', saturation)
	setShaderFloat(object, 'contrast', contrast)
	setShaderFloat(object, 'brightness', brightness)
end

function onCountdownTick(swagCounter)
	if swagCounter == 1 and isGFAdjustFirst(getProperty('gf.curCharacter')) then
		applyDropShadow('gf', hueGF, saturationGF, contrastGF, brightnessGF,
                        shadowAngleGF, distanceGF, shadowColorGF)
	end
end

function onEvent(event, value1, value2, strumTime)
    if event == "badapplelol" then
        if value1 == "a" then
            removeSpriteShader("boyfriend")
			removeSpriteShader("dad")
		else
			applyShaderIfVisible('boyfriend', hueBF, saturationBF, contrastBF, brightnessBF, shadowAngleBF, distanceBF, shadowColorBF)
	        applyShaderIfVisible('dad', hueDAD, saturationDAD, contrastDAD, brightnessDAD, shadowAngleDAD, distanceDAD, shadowColorDAD)
        end
    end
end

function onSongStart()
	if shadersEnabled and isGFAdjustFirst(getProperty('gf.curCharacter')) then
		applyDropShadow('gf', hueGF, saturationGF, contrastGF, brightnessGF,
                        shadowAngleGF, distanceGF, shadowColorGF)
	end
end