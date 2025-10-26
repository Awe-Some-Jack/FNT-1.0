function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Dodge Note' then
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.35'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
		end
	end
end


function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if noteType == 'Dodge Note'  then
		cameraShake("game", 0.05, 0.1)
		playAnim("boyfriend", "dodge"..getRandomInt(1,2), true)

		if songName == "Get Caught" then
			playAnim("gf", "dodge", true)
			setProperty('gf.specialAnim',true)
		end
		setProperty('boyfriend.specialAnim',true)
	end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
	if noteType == 'Dodge Note'  then
		cameraShake("game", 0.05, 0.1)
	end
end