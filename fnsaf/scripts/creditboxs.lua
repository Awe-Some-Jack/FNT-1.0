local artist = {}
local composer = {}
local charter = {}

function onSongCheck()
    if songName == "New Crewmate" then
        artist = { "Snowmelt", "Logan" }
        composer = { "DevinXD" }
        charter = { "Dia" }
    elseif songName == "Accident" then
        artist = { "Logan" }
        composer = { "SDL" }
        charter = { "Dia" }
    elseif songName == "Two Suspect" then
        artist = { "Logan" }
        composer = { "SDL" }
        charter = { "Dia" }
    elseif songName == "Reactor Alarm" then
        artist = { "sucheol" }
        composer = { "DevinXD" }
        charter = { "Dia, Reiad, Snowmelt" }
    elseif songName == "Get Caught" then
        artist = { "Snowmelt" }
        composer = { "DevinXD" }
        charter = { "Snowmelt" }
    end
end

function onSongStart()
    runTimer("ByeBye", 4)

    for i = 1, #CreditStuff do
        doTweenX(CreditStuff[i] .. 'tween', CreditStuff[i], getProperty(CreditStuff[i] .. '.x') + 1000, 1, 'cubeout')
    end
end

function onCreate()
    onSongCheck()

    makeLuaSprite("blackbox", nil)
    makeGraphic("blackbox", 350, 380, "000000")
    screenCenter("blackbox", "y")
    setObjectCamera("blackbox", "other")
    setProperty("blackbox.alpha", 0.5)
    addLuaSprite("blackbox")

    makeLuaText("titletext", songName, 0, 20, 180)
    setObjectCamera("titletext", "other")
    setTextSize("titletext", 30)
    setTextFont("titletext", "neodgm.ttf")
    addLuaText("titletext")

    makeLuaText("ArtistText", "Artist", 0, 20, 230)
    setObjectCamera("ArtistText", "other")
    setTextSize("ArtistText", 20)
    setTextColor("ArtistText", "yellow")
    setTextFont("ArtistText", "neodgm.ttf")
    addLuaText("ArtistText")

    makeLuaText("ComposerText", "Composer", 0, 20, 300)
    setObjectCamera("ComposerText", "other")
    setTextSize("ComposerText", 20)
    setTextColor("ComposerText", "yellow")
    setTextFont("ComposerText", "neodgm.ttf")
    addLuaText("ComposerText")

    makeLuaText("CharterText", "Charter", 0, 20, 370)
    setObjectCamera("CharterText", "other")
    setTextSize("CharterText", 20)
    setTextColor("CharterText", "yellow")
    setTextFont("CharterText", "neodgm.ttf")
    addLuaText("CharterText")

    makeLuaText("credittext", artist, 0, 20, 250)
    setObjectCamera("credittext", "other")
    setTextSize("credittext", 20)
    setTextFont("credittext", "neodgm.ttf")
    addLuaText("credittext")

    makeLuaText("credittext2", composer, 0, 20, 320)
    setObjectCamera("credittext2", "other")
    setTextSize("credittext2", 20)
    setTextFont("credittext2", "neodgm.ttf")
    addLuaText("credittext2")

    makeLuaText("credittext3", charter, 0, 20, 390)
    setObjectCamera("credittext3", "other")
    setTextSize("credittext3", 20)
    setTextFont("credittext3", "neodgm.ttf")
    addLuaText("credittext3")

    for i = 1, #CreditStuff do
        setProperty(CreditStuff[i] .. '.x', getProperty(CreditStuff[i] .. '.x') - 1000)
    end
end

function onUpdate(elapsed)
    if songName == "Two Suspect" then
        for i = 1, #CreditStuff do
            setObjectOrder("spintro", getObjectOrder(CreditStuff[i]) - 29)
        end
    end
end

CreditStuff = { 'blackbox', 'titletext', 'ArtistText', 'ComposerText', 'CharterText', 'credittext', 'credittext2', 'credittext3' }

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "ByeBye" then
        for i = 1, #CreditStuff do
            doTweenX(CreditStuff[i] .. 'tween', CreditStuff[i], getProperty(CreditStuff[i] .. '.x') - 600, 2, 'cubeinout')
        end
    end
end
