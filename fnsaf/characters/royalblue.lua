local originy = 0
function onCreate()

	originy = getProperty('gf.y')

end
function goodNoteHit(i,d,t,s)
	if getPropertyFromGroup('notes',i,'gfNote') then
		setProperty('gf.y',originy+20)
		doTweenY('wifjwif2','gf',originy,0.08,'linear')
	end

end


function onBeatHit()
	if getProperty('gf.animation.curAnim.name') == "idle" or getProperty('gf.animation.curAnim.name') == "idle-alt"then
		setProperty('gf.y',originy+40)
		doTweenY('wifjwiuuf2','gf',originy,0.2,'sineOut')
	end

end