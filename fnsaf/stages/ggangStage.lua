local dir = "bg/ggang/"
local dancing = false

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite('bg', getBG("BACKGROUND"), 0, 0)

    makeLuaSprite('stagefront', getBG("VLUB"), 0, 0)

    if not lowQuality then
        makeLuaSprite('lol1', nil, 1450, 470)
        loadMultipleFrames('lol1', { 'bg/ggang/ALLI', 'bg/ggang/omg/here is mexican' })
        addAnimationByPrefix('lol1', 'idle', 'allian', 24, false)
        addAnimationByPrefix('lol1', 'dance', 'yuayaya', 24, false)

        makeLuaSprite('lol2', nil, 230, 430)
        loadMultipleFrames('lol2', { 'bg/ggang/BEAR AND GRIME', 'bg/ggang/omg/give him more beer' })
        addOffset("lol2", "idle", 0, 0)
        addOffset("lol2", "dance", -100, 0)
        addAnimationByPrefix('lol2', 'idle', 'white beer', 24, false)
        addAnimationByPrefix('lol2', 'dance', '77867', 24, false)

        makeLuaSprite('lol3', nil, 150, 550)
        loadMultipleFrames('lol3', { 'bg/ggang/EVIL GREY', 'bg/ggang/omg/yay!!!!2' })
        addAnimationByPrefix('lol3', 'idle', 'GREY EVIL FUCK', 24, false)
        addAnimationByPrefix('lol3', 'dance', '675', 24, false)

        makeLuaSprite('lol4', nil, 500, 400)
        loadMultipleFrames('lol4', { 'bg/ggang/HOLY GUY', 'bg/ggang/omg/hell yeah' })
        addAnimationByPrefix('lol4', 'idle', 'windowman', 24, false)
        addAnimationByPrefix('lol4', 'dance', '9090', 24, false)
        scaleObject("lol4", 1.2, 1.2)

        makeAnimatedLuaSprite('lol5', getBG("OH NO BEER"), 0, 250)
        addAnimationByPrefix('lol5', 'idle', 'yellow bear', 24, false)

        makeLuaSprite('lol6', nil, 1600, 650)
        loadMultipleFrames('lol6', { 'bg/ggang/OH NO GREY', 'bg/ggang/omg/no fuckin way' })
        addAnimationByPrefix('lol6', 'idle', 'grey half bitch', 24, false)
        addAnimationByPrefix('lol6', 'dance', '754', 24, false)
		
        makeLuaSprite('lol7', nil, 800, -100)
        loadMultipleFrames('lol7', { 'bg/ggang/PARTYGREYD', 'bg/ggang/omg/yay!!!!!!!!!!' })
        addAnimationByPrefix('lol7', 'idle', 'dark grey', 24, false)
        addAnimationByPrefix('lol7', 'dance', '876y785', 24, false)
		
        makeLuaSprite('lol8', nil, 1250, 400)
        loadMultipleFrames('lol8', { 'bg/ggang/REAL RED', 'bg/ggang/omg/jump' })
        addOffset("lol8", "idle", 0, 0)
        addOffset("lol8", "dance", 0, 80)
		addAnimationByPrefix('lol8', 'idle', 'red wisky', 24, false)
        addAnimationByPrefix('lol8', 'dance', 'red yay', 24, false)
		scaleObject("lol8", 1.2, 1.2)

        makeLuaSprite('lol9', nil, 250, 700)
        loadMultipleFrames('lol9', { 'bg/ggang/URPKE', 'bg/ggang/omg/holy shit' })
        addAnimationByPrefix('lol9', 'idle', 'ourple', 24, false)
        addAnimationByPrefix('lol9', 'dance', '8765', 24, false)
		
        makeLuaSprite('lol10', nil, 1600, 600)
        loadMultipleFrames('lol10', { 'bg/ggang/WHAT IS THIS FURRY', 'bg/ggang/omg/furry pog' })
        addAnimationByPrefix('lol10', 'idle', 'white furry', 24, false)
        addAnimationByPrefix('lol10', 'dance', 'yoooo', 24, false)
		
        makeLuaSprite('lol11', nil, 1350, 500)
        loadMultipleFrames('lol11', { 'bg/ggang/WHITE', 'bg/ggang/omg/yay3' })
        addAnimationByPrefix('lol11', 'idle', 'shiudodos', 24, false)
        addAnimationByPrefix('lol11', 'dance', '090909909', 24, false)
		
        makeLuaSprite('lol12', nil, 1300, 600)
        loadMultipleFrames('lol12', { 'bg/ggang/ZOZO', 'bg/ggang/omg/he use twitter' })
        addAnimationByPrefix('lol12', 'idle', 'zotaro', 24, false)
        addAnimationByPrefix('lol12', 'dance', '098', 24, false)
    end
	
    makeLuaSprite('DJman', nil, defaultGirlfriendX + 220, defaultGirlfriendY + 140)
    loadMultipleFrames('DJman', { 'bg/ggang/DJ BLUE', 'bg/ggang/omg/we hate that dj' })
    addOffset("DJman", "idle", 0, 0)
    addOffset("DJman", "dance", -40, -30)
    addAnimationByPrefix('DJman', 'idle', 'blued', 24, false)
    addAnimationByPrefix('DJman', 'dance', 'blurd', 24, false)
	setScrollFactor("DJman", 0.95, 0.95)

    makeLuaSprite('lighting', getBG("HIGHLITHR"), 250, 600)
    setBlendMode("lighting", "add")
	setProperty("lighting.alpha", 0)

    addLuaSprite('bg', false)
	addLuaSprite('lol5', false)
    addLuaSprite('stagefront', false)
    addLuaSprite('lighting', true)
    addLuaSprite('lol8', false)
	addLuaSprite('lol11', false)
    addLuaSprite('lol1', false)
	addLuaSprite('lol4', false)
    addLuaSprite('lol2', false)
    addLuaSprite('lol3', false)
    addLuaSprite('DJman', false)
    addLuaSprite('lol6', true)
    addLuaSprite('lol7', true)
	addLuaSprite('lol9', true)
    addLuaSprite('lol10', false)
	addLuaSprite('lol12', true)
end

function onBeatHit()
    if curBeat % 1 == 0 then
        if dancing then
            playAnim("DJman", "dance", true)
        else
            playAnim("DJman", "idle", true)
        end

        setProperty("lighting.alpha", 1)
        doTweenAlpha("lightingalpha", "lighting", 0, 0.5)
        
        if dancing then
            playAnim("lol1", "dance", true)
            playAnim("lol2", "dance", true)
            playAnim("lol3", "dance", true)
            playAnim("lol4", "dance", true)
            playAnim("lol6", "dance", true)
            playAnim("lol7", "dance", true)
            playAnim("lol8", "dance", true)
            playAnim("lol9", "dance", true)
            playAnim("lol10", "dance", true)
            playAnim("lol11", "dance", true)
            playAnim("lol12", "dance", true)
        end
    end
	
    if curBeat % 2 == 0 then
        if not dancing then
            playAnim("lol1", "idle", true)
            playAnim("lol2", "idle", true)
            playAnim("lol3", "idle", true)
            playAnim("lol4", "idle", true)
            playAnim("lol5", "idle", true)
            playAnim("lol6", "idle", true)
            playAnim("lol7", "idle", true)
            playAnim("lol8", "idle", true)
            playAnim("lol9", "idle", true)
            playAnim("lol10", "idle", true)
            playAnim("lol11", "idle", true)
            playAnim("lol12", "idle", true)
        end
	end
end

function onSectionHit()
    if curSection == 47 then
        dancing = true
    end

    if curSection == 55 then
        dancing = false
    end
end