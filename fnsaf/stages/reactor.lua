local dir = "bg/reactor/"

function onCreate()
    local loc = { -1000, -580 }
    for i = 1, 3 do
        local bgName = "bg" .. i
        makeLuaSprite(bgName, dir .. i, loc[1], loc[2])
        scaleObject(bgName, 2, 2)
        addLuaSprite(bgName)
        if i == 2 then
            setBlendMode(bgName, "add")
        end
    end
end