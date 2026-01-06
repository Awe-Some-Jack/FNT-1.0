local allowEnd = false
local allowEnd2 = false

function onEndSong()
    if isStoryMode and not allowEnd then
        setProperty("camGame.alpha", 0)
        setProperty("camHUD.alpha", 0)
        startVideo('getcaughtendcutscene')
        allowEnd = true
        return Function_Stop;
    elseif isStoryMode and not allowEnd2 then
        startVideo('credits')
        allowEnd2 = true
        return Function_Stop;
    end
    return Function_Continue;
end