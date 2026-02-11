local dir = "bg/ggang/"

function getBG(file)
    return dir .. file
end

function onCreate()
    makeLuaSprite('bg', getBG("BACKGROUND"), 0, 0)

    makeLuaSprite('stagefront', getBG("VLUB"), 0, 0)

    if not lowQuality then
        makeAnimatedLuaSprite('lol1', getBG("ALLI"), 1450, 470)
        addAnimationByPrefix('lol1', 'idle', 'allian', 24, false)

        makeAnimatedLuaSprite('lol2', getBG("BEAR AND GRIME"), 230, 430)
        addAnimationByPrefix('lol2', 'idle', 'white beer', 24, false)

        makeAnimatedLuaSprite('lol3', getBG("EVIL GREY"), 150, 550)
        addAnimationByPrefix('lol3', 'idle', 'GREY EVIL FUCK', 24, false)

        makeAnimatedLuaSprite('lol4', getBG("HOLY GUY"), 500, 400)
        addAnimationByPrefix('lol4', 'idle', 'windowman', 24, false)
        scaleObject("lol4", 1.2, 1.2)

        makeAnimatedLuaSprite('lol5', getBG("OH NO BEER"), 0, 250)
        addAnimationByPrefix('lol5', 'idle', 'yellow bear', 24, false)

		makeAnimatedLuaSprite('lol6', getBG("OH NO GREY"), 1600, 650)
        addAnimationByPrefix('lol6', 'idle', 'grey half bitch', 24, false)
		
		makeAnimatedLuaSprite('lol7', getBG("PARTYGREYD"), 800, -100)
        addAnimationByPrefix('lol7', 'idle', 'dark grey', 24, false)
		
		makeAnimatedLuaSprite('lol8', getBG("REAL RED"), 1250, 400)
		addAnimationByPrefix('lol8', 'idle', 'red wisky', 24, false)
		scaleObject("lol8", 1.2, 1.2)

		makeAnimatedLuaSprite('lol9', getBG("URPKE"), 250, 700)
        addAnimationByPrefix('lol9', 'idle', 'ourple', 24, false)
		
		makeAnimatedLuaSprite('lol10', getBG("WHAT IS THIS FURRY"), 1600, 600)
        addAnimationByPrefix('lol10', 'idle', 'white furry', 24, false)
		
		makeAnimatedLuaSprite('lol11', getBG("WHITE"), 1350, 500)
        addAnimationByPrefix('lol11', 'idle', 'shiudodos', 24, false)
		
		makeAnimatedLuaSprite('lol12', getBG("ZOZO"), 1300, 600)
		addAnimationByPrefix('lol12', 'idle', 'zotaro', 24, false)
    end
	
	makeAnimatedLuaSprite('DJman', getBG("DJ BLUE"), defaultGirlfriendX + 220, defaultGirlfriendY + 140)
	addAnimationByPrefix('DJman', 'idle', 'blued', 24, false)
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
        playAnim("DJman", "idle", true)

        setProperty("lighting.alpha", 1)
		doTweenAlpha("lightingalpha", "lighting", 0, 0.5)
    end
	
	if curBeat %2 == 0 then
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