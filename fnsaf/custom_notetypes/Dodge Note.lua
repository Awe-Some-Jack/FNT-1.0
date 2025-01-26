function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Dodge Note' then
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.24'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
		end
	end
end

local dodgeAnims = {"singLEFT-dodge", "singDOWN-dodge", "singUP-dodge", "singRIGHT-dodge"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Dodge Note' then
		playAnim('boyfriend', dodgeAnims[direction + 1], true);
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Dodge Note' then
		-- put something here if you want
	end
end