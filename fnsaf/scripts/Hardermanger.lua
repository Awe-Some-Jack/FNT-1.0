function opponentNoteHit()
    health = getProperty('health')

    if difficulty == 2 and getProperty('health') > 0.1 then
        setProperty('health', health- 0.01);
    end
end

function onUpdate(elapsed)
    if not botPlay then
        updateScoreText()
    end
end