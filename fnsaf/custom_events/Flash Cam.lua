-- bpforest

function onCreate()
    makeLuaSprite("flashCam")
    makeGraphic("flashCam", 1280, 720, "FFFFFF")
    setObjectCamera("flashCam", "other")
    setProperty("flashCam.alpha", 0)
    addLuaSprite("flashCam")
end

function onEvent(name, v1, v2)
    if name == "Flash Cam" then
        setProperty("flashCam.alpha", v1 == "" and .5 or math.min(0.5, tonumber(v1)))
        doTweenAlpha("flashCamTween", "flashCam", 0, v2 == "" and .3 or tonumber(v2))
    end
end
