local dir = "bg/ship/"
local bg = { -900, -300 }
local crewmates = {
    {"banana", {540, 430}, false, .5},
    {"cream",  {300, 350}, false, .65},
    {"night",  {1110, 340}, false, .6},
    {"agf",    {950, 420}, false, .55},
    {"drpink", {1450, 470}, false, .5},
    {"reddie", {1600, 470}, false, .55},
    {"drbaby", {1580, 800}, false, .6},
    {"royal",  {1700, 630}, false, .6},
    {"melina", {0, 670}, true, .8},
    {"silly",  {200, 750}, true, .8},
    {"spuppy", {1800, 800}, true, .9},
}

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite("1", getBG("1"), bg[1], bg[2])
    scaleObject("1", 1.2, 1.2)

    makeLuaSprite("2", getBG("2"), bg[1], bg[2])
    scaleObject("2", 1.2, 1.2)

    makeLuaSprite("3", getBG("3"), bg[1], bg[2])
    scaleObject("3", 1.2, 1.2)
    setBlendMode("3", "add")

    addLuaSprite("1")

    for _, crew in ipairs(crewmates) do
        local name, pos, front, scale
        = crew[1], crew[2], crew[3], crew[4]

        makeAnimatedLuaSprite(name, getBG("crewmates"), bg[1] + pos[1], bg[2] + pos[2])
        addAnimationByPrefix(name, "idle", name, 24, false)
        scaleObject(name, scale, scale)
        addLuaSprite(name, front)
    end

    addLuaSprite("2")
    addLuaSprite("3", true)
end

function onStartCountdown()
    if songName == "New Crewmate" then
        for _, crew in ipairs(crewmates) do
            local name = crew[1]
    
            setProperty(name..".alpha", 0)
            setProperty(name..'.colorTransform.redOffset', 255)
            setProperty(name..'.colorTransform.blueOffset',  255)
            setProperty(name..'.colorTransform.greenOffset',  255)
        end
    end
end

function onBeatHit()
    if curBeat % 2 ~= 0 then return end
    for _, crew in ipairs(crewmates) do
        local name = crew[1]
        playAnim(name, "idle")
    end
end

function onStepHit()
    if songName == "New Crewmate" then
        if curStep == 68 then
            Getin()
        end
    end
end

function Getin()	
    for _, crew in ipairs(crewmates) do
        local name = crew[1]
        setProperty(name..".alpha", 1)
        runHaxeCode([[ 
        var objName = "]] .. name .. [["; 
        if (game.getLuaObject(objName) != null) {
        FlxTween.tween(game.getLuaObject(objName).colorTransform, { redOffset: 0, greenOffset: 0, blueOffset: 0, redMultiplier: 1, greenMultiplier: 1, blueMultiplier: 1 }, 1);
        } else {
            trace("Object not found: " + objName);
        }
    ]])
    end

end