local compo = ""
local chart = ""
local art = ""
local cover = ""

function onEvent(eventName, value1, value2, strumTime)
	if eventName == "Song Title Card" then
		if value1 == "" then
			setTextString("SongName", string.upper(songName))
		else
		    setTextString("SongName", value1)
		end

		if value2 == "" then
			if songName == "New Crewmate" then
				compo = "DevinXD "
				chart = "Sha_mi0921 "
				art = "Snowmelt, Logan "
			elseif songName == "Accident" then
                compo = "SDL "
				chart = "Sha_mi0921 "
				art = "Logan "
			elseif songName == "Two Suspect" then
                compo = "SDL "
				chart = "Sha_mi0921 "
				art = "Logan "
			elseif songName == "Reactor Alarm" then
                compo = "DevinXD "
				chart = "Snowmelt "
				art = "ENT "
			elseif songName == "Get Caught" then
                compo = "DevinXD "
				chart = "Snowmelt "
				art = "Snowmelt "
			elseif songName == "Brothers in Arms" then
                compo = "Awe "
				chart = "Snowmelt "
				art = "Logan "
				cover = "??? "

				setTextString("Who", "Composer by:"..compo.. "Charter by:" ..chart.. "\nArtist by:"..art.. "Cover by:"..cover)
			end
			setTextString("Who", "Composer by:"..compo.. "Charter by:" ..chart.. "\nArtist by:"..art)
		else
			setTextString("Who", value2)
		end
	end
end