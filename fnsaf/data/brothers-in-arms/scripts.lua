local forevent = false
local isgf = false

cameraevnet = {928, 992, 1280, 1632}
nocameraevnet = {960, 1248, 1376}

function onCreate()
    setProperty("gf.alpha", 0)
end

function onUpdate(elapsed)
    if isgf and not forevent then
        changestrum()
    else
        changedefault()
    end
end

function onStepHit()
    if curStep == 907 then
        doTweenX("BFX", "boyfriend", 260, 0.3, "cubeOut")
        setProperty("gf.alpha", 1)
        triggerEvent("Play Animation", "anime", "gf")
    end

    for i = 1,#cameraevnet do 
		if curStep == cameraevnet[i] then
            isgf = true
		end
	end

    for i = 1,#nocameraevnet do 
		if curStep == nocameraevnet[i] then
            isgf = false
		end
	end

    if curStep == 2144 then
        cameraFade("hud", "000000", 0.001, false)
    end
end

function changestrum()
    noteTweenX("bf1", 4, defaultOpponentStrumX0, 1, "cubeOut")
    noteTweenX("bf2", 5, defaultOpponentStrumX1, 1, "cubeOut")
    noteTweenX("bf3", 6, defaultOpponentStrumX2, 1, "cubeOut")
    noteTweenX("bf4", 7, defaultOpponentStrumX3, 1, "cubeOut")

    noteTweenX("opponent1", 0, defaultPlayerStrumX0, 1, "cubeOut")
    noteTweenX("opponent2", 1, defaultPlayerStrumX1, 1, "cubeOut")
    noteTweenX("opponent3", 2, defaultPlayerStrumX2, 1, "cubeOut")
    noteTweenX("opponent4", 3, defaultPlayerStrumX3, 1, "cubeOut")
end

function changedefault()
    noteTweenX("bf1", 4, defaultPlayerStrumX0, 1, "cubeOut")
    noteTweenX("bf2", 5, defaultPlayerStrumX1, 1, "cubeOut")
    noteTweenX("bf3", 6, defaultPlayerStrumX2, 1, "cubeOut")
    noteTweenX("bf4", 7, defaultPlayerStrumX3, 1, "cubeOut")

    noteTweenX("opponent1", 0, defaultOpponentStrumX0, 1, "cubeOut")
    noteTweenX("opponent2", 1, defaultOpponentStrumX1, 1, "cubeOut")
    noteTweenX("opponent3", 2, defaultOpponentStrumX2, 1, "cubeOut")
    noteTweenX("opponent4", 3, defaultOpponentStrumX3, 1, "cubeOut")
end