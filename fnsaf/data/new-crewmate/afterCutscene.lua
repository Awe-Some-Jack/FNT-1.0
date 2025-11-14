local allowEnd = false

function onEndSong()
    if not allowEnd then
        setProperty("camGame.alpha", 0)
        setProperty("camHUD.alpha", 0)
        startVideo('accident1')
        allowEnd = true
        return Function_Stop;
    end
    return Function_Continue;
end