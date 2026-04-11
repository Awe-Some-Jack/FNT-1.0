-- bpforest

local noteXPos = {}
local noteMidXPos = {}

function onSongStart()
    noteXPos = { defaultPlayerStrumX0, defaultPlayerStrumX3 }
    noteMidXPos = { defaultOpponentStrumX2, defaultOpponentStrumX3, defaultPlayerStrumX0, defaultPlayerStrumX1 }
end

function lerp(num1, num2, pos)
    return ((num2 - num1) * pos) + num1
end

function onEvent(n, v1, v2)
    if n ~= "Middlescroll" then return end
    if not middlescroll then
        if v1 == "1" then
            for i = 0, 7 do
                if i < 4 then
                    setPropertyFromGroup("strumLineNotes", i, "alpha", 0)
                else
                    setPropertyFromGroup("strumLineNotes", i, "x", noteMidXPos[i - 3])
                end
            end
        elseif v1 == "0" then
            for i = 0, 7 do
                if i < 4 then
                    setPropertyFromGroup("strumLineNotes", i, "alpha", 1)
                else
                    setPropertyFromGroup("strumLineNotes", i, "x", lerp(noteXPos[1], noteXPos[2], (i - 4) / 3))
                end
            end
        end
    end
end
