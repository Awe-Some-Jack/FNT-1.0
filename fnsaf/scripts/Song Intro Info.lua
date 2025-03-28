local showme = false

function onCreate()
    makeLuaSprite('BoxTag', '', -1500, 300)
	makeGraphic('BoxTag', 1280, 280, '000000')
	setObjectCamera('BoxTag', 'camOther')
	addLuaSprite('BoxTag', true)
	setProperty('BoxTag.alpha', 0.6)

	makeLuaText('SongName', string.upper(songName), 1300, -1500, 250);
	setTextAlignment('SongName', 'center')
	setTextSize('SongName', 120);
	setObjectCamera('SongName', 'camOther');
	setTextColor('SongName', '0xFFFFFF');
	setTextBorder('SongName', "0", "000000")
	setTextFont("SongName", "Roboto.ttf")
	addLuaText('SongName', true);

	makeLuaText('Who', compo, 1300, -1500, 400);
	setTextAlignment('Who', 'center')
	setTextSize('Who', 40);
	setObjectCamera('Who', 'camOther');
	setTextColor('Who', '0xFFFFFF');
	setTextFont("Who", "Roboto.ttf")
	setTextBorder('Who', "0", "000000")
	addLuaText('Who', true);

-----------------------------------------------------------------------
	screenCenter('BoxTag', 'y')
end

function onUpdate()
	if showme then
        doTweenX("Tween1", "SongName", 0, 1.0, "cubeOut")
        doTweenX("Tween2", "Who", 0, 1.0, "cubeOut")
	    doTweenX('Tween3', 'BoxTag', 0, 1.0, 'CubeOut')
	end
end

function onEvent(eventName, value1, value2, strumTime)
	if eventName == "Song Title Card" then
		showme = true
		runTimer('dh', 5)
	end
end

function onTweenCompleted(tag)
    if tag == "ohHolyShit22" then
        removeLuaText("SongName", true)
        removeLuaText("Who", true)
        removeLuaSprite("BoxTag", true)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'dh' then
		doTweenAlpha('ohHolyShit2', 'SongName', 0, 1, 'quintOut')
		doTweenAlpha('ohHolyShitn2', 'Who', 0, 1, 'quintOut')
		doTweenAlpha('ohHolyShit!2', 'BoxTag', 0, 1, 'quintOut')

		doTweenY('ohHolyShit22', 'SongName', getProperty('SongName.y') + 80, 2, 'quintOut')
		doTweenY('ohHolyShitn22', 'Who', getProperty('Who.y') + 80, 2, 'quintOut')
		doTweenY('ohHolyShit!22', 'BoxTag', getProperty('BoxTag.y') + 80, 2, 'quintOut')
	end
end