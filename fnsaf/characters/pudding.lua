local bfOffsets = {
    idle      = {x = 0,   y = 0},
    dodge     = {x = 43,  y = 35},
    singLEFT  = {x = 120, y = -9},
    singDOWN  = {x = 0, y = -42},
    singUP    = {x = 3,   y = 5},
    singRIGHT = {x = -80, y = -23}
}

function goodNoteHit(id, direction, noteType, isSustainNote)
    if getProperty("boyfriend.flipX") then
        if direction == 0 then
            characterPlayAnim("boyfriend", "singRIGHT", true)
        elseif direction == 3 then
            characterPlayAnim("boyfriend", "singLEFT", true)
        end
    end
end

local originalOffset = {x = 0, y = 0}
local lastFlipX = false

function onUpdatePost()
    local flipX = getProperty("boyfriend.flipX")
    local anim = getProperty("boyfriend.animation.curAnim.name")
    if not anim then return end

    -- flipX 켜질 때 원래 offset 저장
    if flipX and not lastFlipX then
        originalOffset.x = getProperty("boyfriend.offset.x")
        originalOffset.y = getProperty("boyfriend.offset.y")
    end

    if flipX and bfOffsets[anim] then
        local ox = bfOffsets[anim].x
        local oy = bfOffsets[anim].y

        setProperty("boyfriend.offset.x", -ox)
        setProperty("boyfriend.offset.y", oy)

    elseif not flipX and lastFlipX then
        -- flipX 해제 → 정확히 원복
        setProperty("boyfriend.offset.x", originalOffset.x)
        setProperty("boyfriend.offset.y", originalOffset.y)
    end

    lastFlipX = flipX
end
