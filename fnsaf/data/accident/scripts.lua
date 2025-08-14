function onCreate()
    setProperty("dad.visible", false)
end

function onStartCountdown()
    cameraFade("game", "000000", 1.6, false, true)
    callMethod('iconP2.changeIcon', {'question'})
    setHealthBarColors("white", "")
end

function onSectionHit()
    if curSection == 8 then
        doTweenX("MovingBG", "back1", 5000, 70)
    end
end

function onStepHit()
    if curStep == 95 then
        setProperty("dad.visible", true)
        callMethod('iconP2.changeIcon', {'puppy'})
        setHealthBarColors("A54CFF", "")
    end
end


function onUpdate(elapsed)
    setCameraScroll(700, 500)
end