local starspin = 0

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

    starspin = starspin + (200 * elapsed)
    setProperty("finalstar.angle", starspin)
end

function onUpdatePost(elapsed)
    removeSpriteShader('boyfriend')
    removeSpriteShader('dad')

    setShaderBool('boyfriend', 'useMask', false)
    setShaderBool('dad', 'useMask', false)

    runHaxeCode([[
        game.boyfriend.shader = null;
        game.dad.shader = null;
    ]])

    setProperty("boyfriend.color", FlxColor("magenta"))
end

function removeCharShader(char)
    removeSpriteShader(char)
    setShaderBool(char, 'useMask', false)

    runHaxeCode([[
        var obj = switch("]] .. char .. [[") {
            case "boyfriend": game.boyfriend;
            case "dad": game.dad;
            case "gf": game.gf;
        };

        if(obj != null)
        {
            obj.shader = null;
            obj.animation.callback = null;
        }
    ]])
end

function removeAllShaders()
    removeCharShader('boyfriend')
    removeCharShader('dad')
    removeCharShader('gf')
end

function onCreatePost()
    removeAllShaders()
end

function onEvent(event)
    if event == 'Change Character' then
        runTimer('shaderFix', 0.01)
    end
end

function onTimerCompleted(tag)
    if tag == 'shaderFix' then
        removeAllShaders()
    end
end
