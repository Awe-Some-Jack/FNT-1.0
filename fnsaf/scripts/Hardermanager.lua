local waralpha = 0


function onCreatePost()
    if difficulty ~= 0 then
        makeLuaSprite("Warning", "RedWar")
        setObjectCamera("Warning", "hud")
        setProperty("Warning.alpha", waralpha)
    end
    addLuaSprite("Warning", true)
end

function opponentNoteHit()
    health = getProperty('health')

    if difficulty == 2 and getProperty('health') > 0.1 then
        setProperty('health', health- 0.01);
    end

    if songName == "Get Caught" and gfSection then
        setProperty('health', health- 0);
    end
end

function onUpdate(elapsed)
    if not botPlay then
        updateScoreText()
    end
end

function noteMiss(index, noteData, noteType, isSustain)
    if difficulty == 1 then
        waralpha = waralpha + 0.035
    elseif difficulty == 2 then
        waralpha = waralpha + 0.20
    end
    doTweenAlpha("AlphaWar", "Warning", waralpha, 0.2, "linear")
    
    if difficulty >= 1 then
        playSound("heartbeat")
    end
    ----debugPrint(waralpha)
end