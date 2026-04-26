local starspin = 0
local shaderRemoved = false

function onCreate()
    makeLuaSprite('bg', 'bg/triple/Finale/dark_bg2', -2100, -1900)

    makeLuaSprite('finalstar', 'bg/triple/Finale/final_star', -1100, -1900)

    makeLuaSprite('top3', 'bg/triple/Finale/top_3', -380, -1000)

    makeLuaSprite('top3_alt', 'bg/triple/Finale/top_alt', 680, -300)

    makeLuaSprite('top3_alt2', 'bg/triple/Finale/top_alt', 0, 0)
    setProperty("top3_alt2.flipX", true)

    makeLuaSprite('top3_center', 'bg/triple/Finale/top_alt_center', 0, 0)

    makeLuaSprite('topdown3', 'bg/triple/Finale/topdown_3', -100, 620)

    makeLuaSprite('topdownob', 'bg/triple/Finale/topdown_object', -1000, 580)

    makeLuaSprite('topdown3', 'bg/triple/Finale/topdown_3', -100, 620)

    makeLuaSprite('topdownob2', 'bg/triple/Finale/topdown_object2', -1330, 250)

    makeLuaSprite('finalob', 'bg/triple/Finale/final_object', -2100, -1900)

    makeLuaSprite('finalob2', 'bg/triple/Finale/final_object2', -2100, -700)

    makeLuaSprite('finalob3', 'bg/triple/Finale/final_object3', 1700, -1000)

    addLuaSprite('bg', false)
    addLuaSprite('finalstar', false)
    addLuaSprite('top3', false)
    addLuaSprite('top3_alt', false)
    addLuaSprite('top3_alt2', false)
    addLuaSprite('top3_center', false)
    addLuaSprite('topdownob', false)
    addLuaSprite('topdown3', false)
    addLuaSprite('topdownob2', false)
    addLuaSprite('finalob', true)
    addLuaSprite('finalob2', true)
    addLuaSprite('finalob3', true)
end

function onUpdate(elapsed)
    setProperty("top3_alt2.x", getProperty("spexe-final.x") - 150)
    setProperty("top3_alt2.y", getProperty("spexe-final.y") + 370)

    setProperty("top3_alt.x", getProperty("wallyexe-final.x") + 10)
    setProperty("top3_alt.y", getProperty("wallyexe-final.y") + 410)

    setProperty("top3_center.x", getProperty("agfexe-final.x") + 80)
    setProperty("top3_center.y", getProperty("agfexe-final.y") + 580)

    starspin = starspin + (30 * elapsed)
    setProperty("finalstar.angle", starspin)

    if not shaderRemoved and shadersEnabled then
        runHaxeCode([[
            for (obj in [game.boyfriend, game.dad]) {
                if (obj != null && obj.animation != null) {
                    obj.animation.callback = null;
                }
                if (obj != null) obj.shader = null;
            }
        ]])
        removeSpriteShader('boyfriend')
        removeSpriteShader('dad')
        shaderRemoved = true
    end

    setProperty("boyfriend.color", getColorFromHex('FF00FF'))
end