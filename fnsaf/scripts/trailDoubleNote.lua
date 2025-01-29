
function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end

function split(inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end

function string.starts(String,Start)
	return string.sub(String,1,string.len(Start))==Start
end

local rows = {
	gf = {},
	bf = {},
	dd = {},
	mm = {}
}
local gfRows = {}
local bfRows = {}
local ddRows = {}
local mmRows = {}

function charData(char, shortchar, id, direction)
	local frameName = getProperty(char .. '.animation.frameName')
	local susLength = getPropertyFromGroup('notes', id, 'tail.length')
	frameName = string.sub(frameName, 1, string.len(frameName) - 3)

	return {frameName, getProperty(char .. '.offset.x'), getProperty(char .. '.offset.y'),
			direction, susLength}
end

function trailLogic(id, direction, isSustainNote, char, shortchar)
	shortchar = string.sub(shortchar or char, 1, 2)
	local charName = getProperty(char .. '.curCharacter')
	if not isSustainNote then
		local strumTime = charName..getPropertyFromGroup('notes', id, 'strumTime')

		local save = charData(char, shortchar, id, direction)
		if rows[shortchar][strumTime] and rows[shortchar][strumTime][4] ~= direction then
			-- debugPrint({rows[shortchar][strumTime][5], save[5], rows[shortchar][strumTime][4], save[4]})
			-- debugPrint('hi there!')
			if rows[shortchar][strumTime][5] > save[5] then
				ghostTrail(char, save, isSustainNote)
			else
				ghostTrail(char, rows[shortchar][strumTime], isSustainNote)
			end
		end

		rows[shortchar][strumTime] = save
		runTimer('traily|' .. shortchar .. '|' .. strumTime)
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	trailLogic(id, direction, isSustainNote, 'boyfriend', 'bf')
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType ~= 'Both Opponents Sing' then
		if getPropertyFromGroup('notes', id, 'gfNote') then
			trailLogic(id, direction, isSustainNote, 'gf')
		elseif noteType ~= 'Opponent 2 Sing' then
			trailLogic(id, direction, isSustainNote, 'dad', 'dd')
		else
			trailLogic(id, direction, isSustainNote, 'mom', 'mm')
		end
	else
		trailLogic(id, direction, isSustainNote, 'dad', 'dd')
		trailLogic(id, direction, isSustainNote, 'mom', 'mm')
	end
end

function ghostTrail(char, noteData)
	local ghost = char..'Ghost'
	local group = char
	if char == 'mom' then
		group = 'dad'
	end

	-- debugPrint(getProperty(char..'.imageFile'));
	makeAnimatedLuaSprite(ghost, getProperty(char..'.imageFile'), getProperty(char..'.x'), getProperty(char..'.y'))
	addAnimationByPrefix(ghost, 'idle', noteData[1], 24, false)
	setProperty(ghost..'.antialiasing', getProperty(char..'.antialiasing'))
	setProperty(ghost..'.offset.x', noteData[2])
	setProperty(ghost..'.offset.y', noteData[3])
	setProperty(ghost..'.scale.x', getProperty(char..'.scale.x'))
	setProperty(ghost..'.scale.y', getProperty(char..'.scale.y'))
	setProperty(ghost..'.flipX', getProperty(char..'.flipX'))
	setProperty(ghost..'.flipY', getProperty(char..'.flipY'))
	setProperty(ghost..'.visible', getProperty(char..'.visible'))
	setProperty(ghost..'.color', getIconColor(char))
	setProperty(ghost..'.alpha', 0.8 * getProperty(char..'.alpha'))
	setBlendMode(ghost, 'hardlight')
	addLuaSprite(ghost)
	playAnim(ghost, 'idle', true)
	setObjectOrder(ghost, getObjectOrder(group..'Group') - 0.1)
	cancelTween(ghost)
	doTweenAlpha(ghost, ghost, 0, 0.75, 'linear')

	local stage = string.lower(curStage)
	if stage == 'who' or stage == 'voting' or stage == 'nuzzus' or stage == 'idk' then
		--erm
	elseif stage == 'cargo' or stage == 'finalem' then
		triggerEvent('Add Camera Zoom', '0.015', '0.015')
	else
		triggerEvent('Add Camera Zoom', '0.015', '0.03')
	end

    -- runHaxeCode([[
    --     game.getLuaObject(']]..ghost..[[').shader = game.]]..char..[[.shader;
    -- ]])
end

function onTimerCompleted(tag, loops, loopsLeft)
	if string.starts(tag, 'traily') then
		local splitted = split(tag, '|')
		rows[splitted[2]][splitted[3]] = nil
	end
end

function onTweenCompleted(tag)
	if string.match(tag, 'Ghost') then
		removeLuaSprite(tag, true)
	end
end