local allowEnd = false

function onEndSong()
    if isStoryMode and not allowEnd then
        setProperty("camGame.alpha", 0)
        setProperty("camHUD.alpha", 0)
        startVideo('reac 2')
        allowEnd = true
        return Function_Stop;
    end
    return Function_Continue;
end