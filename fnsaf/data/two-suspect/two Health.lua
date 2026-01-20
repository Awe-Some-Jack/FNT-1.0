local LeftHealth = 250
local RightHealth = 250

local maxValue = 520
local maxValue2 = 520

local useCustom = false
local wtfDeath = false

function onCreatePost()
    -- Left Bar
    makeLuaSprite("p1BarLeft", 'UI/health1', 90, (downscroll and 35 or 600))
    makeLuaSprite("p1BarRight", 'UI/health2', 90, (downscroll and 35 or 600))

    setProperty("p1BarLeft.alpha", 0)
    setProperty("p1BarRight.alpha", 0)

    scaleObject("p1BarLeft", 0.9, 0.9)
    scaleObject("p1BarRight", 0.9, 0.9)

    setObjectCamera("p1BarLeft", 'hud')
    setObjectCamera("p1BarRight", 'hud')

    createInstance('LeftP1', 'objects.HealthIcon', {'puppy-suspect'})
    setProperty("LeftP1.flipX", true)
    setObjectOrder("LeftP1", getObjectOrder("p1BarLeft") + 1, "uiGroup")
    setProperty("LeftP1.alpha", 0)
    addToGroup('uiGroup', "LeftP1")
    setObjectCamera("LeftP1", "hud")

    createInstance('LeftP2', 'objects.HealthIcon', {'agf-happy'})
    addToGroup('uiGroup', "LeftP2")
    setProperty("LeftP2.alpha", 0)
    setObjectOrder("LeftP2", getObjectOrder("p1BarLeft") + 1, "uiGroup")
    setObjectCamera("LeftP2", "hud")

    addLuaSprite("p1BarRight", false)
    addLuaSprite("p1BarLeft", false)
    addInstance('LeftP1', true)
    addInstance('LeftP2', true)

    -- Right Bar
    makeLuaSprite("p2BarLeft", 'UI/health3', 710,  (downscroll and 35 or 600))
    makeLuaSprite("p2BarRight", 'UI/health4', 710,  (downscroll and 35 or 600))

    setProperty("p2BarLeft.alpha", 0)
    setProperty("p2BarRight.alpha", 0)

    scaleObject("p2BarLeft", 0.9, 0.9)
    scaleObject("p2BarRight", 0.9, 0.9)

    setObjectCamera("p2BarLeft", 'hud')
    setObjectCamera("p2BarRight", 'hud')

    createInstance('RightP1', 'objects.HealthIcon', {'bf-suspect'})
    setObjectOrder("RightP1", getObjectOrder("p2BarRight") + 1, "uiGroup")
    setProperty("RightP1.alpha", 0)
    addToGroup('uiGroup', "RightP1")
    setObjectCamera("RightP1", "hud")

    createInstance('RightP2', 'objects.HealthIcon', {'wally'})
    addToGroup('uiGroup', "RightP2")
    setObjectOrder("RightP2", getObjectOrder("p2BarRight") + 1, "uiGroup")
    setProperty("RightP2.alpha", 0)
    setProperty("RightP2.flipX", true)
    setObjectCamera("RightP2", "hud")

    addLuaSprite("p2BarRight", false)
    addLuaSprite("p2BarLeft", false)
    addInstance('RightP1', true)
    addInstance('RightP2', true)


    addToGroup("uiGroup", "p1BarRight")
    addToGroup("uiGroup", "p1BarLeft")
    addToGroup("uiGroup", "p2BarRight")
    addToGroup("uiGroup", "p2BarLeft")
end

healthBarStuff = {'iconP1', 'iconP2', 'healthBar'}
CustomhealthBarStuff = {'p1BarLeft', 'p1BarRight', 'p2BarLeft', "p2BarRight", "LeftP1", "LeftP2", "RightP1", "RightP2"}

function onSectionHit()
    if curSection == 43 then
        for i = 1,#healthBarStuff do
            if downscroll then
                doTweenY(healthBarStuff[i]..'tween', healthBarStuff[i], getProperty(healthBarStuff[i]..'.y') - 1500, 0.5, 'cubeinout')
            else
                doTweenY(healthBarStuff[i]..'tween', healthBarStuff[i], getProperty(healthBarStuff[i]..'.y') + 1500, 0.5, 'cubeinout')
            end
		end
    end

    if curSection == 44 then
        for i = 1,#CustomhealthBarStuff do
            doTweenAlpha(CustomhealthBarStuff[i]..'tween', CustomhealthBarStuff[i], 1, 0.5)
            useCustom = true
		end
    end

    if curSection == 73 then
        wtfDeath = true
    end

    if curSection == 82 then
        wtfDeath = false
    end
end

function onUpdate(elapsed)
    if useCustom then
        setHealth(1)
    end
    
    if LeftHealth >= 520 then
        setHealth(0)
    end

    if RightHealth <= 0 then
        setHealth(0)
    end

    setProperty("LeftP1.scale.x", getProperty("iconP1.scale.x"))
    setProperty("LeftP1.scale.y", getProperty("iconP1.scale.y"))

    setProperty("RightP1.scale.x", getProperty("iconP1.scale.x"))
    setProperty("RightP1.scale.y", getProperty("iconP1.scale.y"))

    setProperty("LeftP2.scale.x", getProperty("iconP2.scale.x"))
    setProperty("LeftP2.scale.y", getProperty("iconP2.scale.y"))

    setProperty("RightP2.scale.x", getProperty("iconP2.scale.x"))
    setProperty("RightP2.scale.y", getProperty("iconP2.scale.y"))
end

function onUpdatePost(elapsed)
	setProperty("p1BarLeft._frame.frame.width", LeftHealth)
    setProperty("p2BarLeft._frame.frame.width", RightHealth)

    LeftHealth = math.min(math.max(LeftHealth, 4), maxValue)
    RightHealth = math.min(math.max(RightHealth, 0), maxValue)

    --LeftHealth Icons
    if LeftHealth > 420 then
        setProperty('LeftP1.animation.curAnim.curFrame',1)
        setProperty('LeftP2.animation.curAnim.curFrame',2)
    elseif LeftHealth < 100 then
        setProperty('LeftP1.animation.curAnim.curFrame',2)
        setProperty('LeftP2.animation.curAnim.curFrame',1)
    else
        setProperty('LeftP1.animation.curAnim.curFrame',0)
        setProperty('LeftP2.animation.curAnim.curFrame',0)
    end

    --RightHealth Icons
    if RightHealth < 100 then
        setProperty('RightP1.animation.curAnim.curFrame',1)
        setProperty('RightP2.animation.curAnim.curFrame',2)
    elseif RightHealth > 420 then
        setProperty('RightP1.animation.curAnim.curFrame',2)
        setProperty('RightP2.animation.curAnim.curFrame',1)
    else
        setProperty('RightP1.animation.curAnim.curFrame',0)
        setProperty('RightP2.animation.curAnim.curFrame',0)
    end

    setProperty("LeftP1.x", getProperty("p1BarLeft.x") + 420)
    setProperty("LeftP1.y", getProperty("p1BarLeft.y") - 35)

    setProperty("LeftP2.x", getProperty("p1BarLeft.x") - 100)
    setProperty("LeftP2.y", getProperty("p1BarLeft.y") - 35)

    setProperty("RightP1.x", getProperty("p2BarRight.x") - 85)
    setProperty("RightP1.y", getProperty("p2BarRight.y") - 35)

    setProperty("RightP2.x", getProperty("p2BarRight.x") + 420)
    setProperty("RightP2.y", getProperty("p2BarRight.y") - 35)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'GF Sing' or gfSection then
        if LeftHealth > 0 and useCustom then
            if LeftHealth < 0 then
                LeftHealth = 0
            end

            if guitarHeroSustains and not isSustainNote then
                LeftHealth = LeftHealth - 3.5
            elseif not guitarHeroSustains then
                LeftHealth = LeftHealth - 3
            end
        end
        --debugPrint(LeftHealth)
    elseif useCustom then
        if RightHealth < 520 then
            if RightHealth > 520 then
                RightHealth = 0
            end

            if guitarHeroSustains and not isSustainNote then
                RightHealth = RightHealth + 3.5
            elseif not guitarHeroSustains then
                RightHealth = RightHealth + 3
            end
        end
        --debugPrint(RightHealth)
    end
end

function noteMiss(index, noteData, noteType, isSustain)
    if noteType == 'GF Sing' or gfSection and useCustom then
        LeftHealth = LeftHealth + 11
    elseif useCustom then
        RightHealth = RightHealth - 11
    end

    if useCustom and wtfDeath then
        setHealth(0)
        useCustom = false
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)

end