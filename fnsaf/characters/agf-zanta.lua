local originy = 0
function onCreate()
    originy = getProperty('dad.y')
end

function opponentNoteHit(i, d, t, isSustain)
	if not getPropertyFromGroup('notes',i,'gfNote') then
	    setProperty('dad.y',originy+20)
	    doTweenY('wifjwiaf','dad',originy,0.08,'linear')
	end	
end

function opponentNoteHitPre(index, noteData, noteType, isSustain)
	if getProperty('health') > 0.1 and not isSustain and guitarHeroSustains then
        setProperty('health', getProperty('health') - 0.01)
	elseif getProperty('health') > 0.1 and not guitarHeroSustains then
		setProperty('health', getProperty('health') - 0.015)
	end
end


function onBeatHit()
	if getProperty('dad.animation.curAnim.name') == "idle" or getProperty('dad.animation.curAnim.name') == "idle-alt"  then
		setProperty('dad.y',originy+40)
		doTweenY('wifjwiaaf','dad',originy,0.2,'linear')
	end

end