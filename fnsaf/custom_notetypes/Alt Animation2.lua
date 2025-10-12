function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Alt Animation2' then
			setPropertyFromGroup('unspawnNotes', i,'animSuffix', '-alt2')
		end
	end
end