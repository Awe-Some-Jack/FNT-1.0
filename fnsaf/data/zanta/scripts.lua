Look = false
showthis = false
xx = 0
yy = 0
icons = "agf-zanta"

function onCreate()
    setObjectOrder("gfGroup", getObjectOrder("banana") + 1)
    setObjectOrder("gfGroup", getObjectOrder("boyfriendGroup") + 1)

    makeLuaText("Subtitle", "sample", 800, 0, 530)
    screenCenter("Subtitle", "x")
    setTextSize("Subtitle", 25)
    setTextFont("Subtitle", "neodgm.ttf")
    setProperty("Subtitle.alpha", 0)
    setTextAlignment("Subtitle", "center")
    setObjectCamera("Subtitle", "other")
    addLuaText("Subtitle")

    makeLuaSprite("SubIcon", "")
    setObjectCamera("SubIcon", "other")
    addLuaSprite("SubIcon")
end

function onUpdate(elapsed)
    loadGraphic("SubIcon", "icons/icon-"..icons, 150, 150)
    setProperty("SubIcon.x", getProperty("Subtitle.x"))
    setProperty("SubIcon.width", getProperty("Subtitle.width"))
    setProperty("SubIcon.y", getProperty("Subtitle.y") - 80)
    setProperty("SubIcon.alpha", getProperty("Subtitle.alpha"))
end

function onUpdatePost(elapsed)
    if Look then
        setCameraScroll(xx, yy)
    end

    if showthis then
        triggerEvent('Camera Follow Pos','480','360')
    end
end

function onSectionHit()
    if curSection == 82 then
        showthis = true
    end

    if curSection == 84 then
        showthis = false
    end

    if curSection == 124 then
        Look = false
    end
end

function onStepHit()
    if curStep == 1335 then
        objectPlayAnimation("banana", "dead")
        cameraFlash("game", "FFFFFF", 0.5, true)
    end

    if curStep == 1344 then
        cameraFlash("game", "FFFFFF", 0.4, true)
    end

    if curStep == 1605 then
        setTextString("Subtitle", "How can you defeat somebody you can't?\n어떻게 이길거지?")
        setProperty("Subtitle.alpha", 1)
    end

    if curStep == 1625 then
        setProperty("Subtitle.alpha", 0)
    end

    if curStep == 1621 then
        objectPlayAnimation("gate", "open")
    end

    if curStep == 1628 then
        objectPlayAnimation("who", "bald")
    end

    if curStep == 1633 then
        objectPlayAnimation("who", "alt")
        setProperty("who.x", 1465)
    end

    if curStep == 1640 then
        setTextString("Subtitle", "Recognize\n못 알아볼텐데?")
        setProperty("Subtitle.alpha", 1)
    end

    if curStep == 1666 then
        setTextString("Subtitle", "Ugh, Who is the Real AGF!?\n아잇 누가 진짜 어그야!?")
        icons = "royalblue"
        setProperty("Subtitle.alpha", 1)
    end

    if curStep == 1696 then
        setProperty("Subtitle.alpha", 0)
    end

    if curStep == 1952 then
        objectPlayAnimation("who", "hurt")
        xx = 1350
        yy = 350
        Look = true
    end

    if curStep == 1960 then
        setTextString("Subtitle", "Are You Dumb HEAD???\n너 진짜 빡대가리야???")
        xx = 700
        icons = "cream"
        setProperty("Subtitle.alpha", 1)
    end

    if curStep == 1980 then
        setTextString("Subtitle", "AAAAAAAAAAAAAA!!!!!!\n아아아아아아아아아악!!!!!!!")
        icons = "royalblue"
    end

    if curStep == 1995 then
        doTweenAlpha("Bye", "Subtitle", 0, 0.2, "linear")
    end
end
