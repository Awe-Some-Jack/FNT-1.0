local bfOffsets = {
    idle   = {x = 0,   y = 0},
    singLEFT  = {x = 148, y = 5},
    singDOWN  = {x = -39,  y = -45},
    singUP    = {x = 0, y = -3},
    singRIGHT = {x = -55,  y = -33},
    dodge     = {x = 71,   y = 56}
}

function goodNoteHit(id, direction, noteType, isSustainNote)
    if getProperty("boyfriend.flipX") then
        if direction == 0 then -- LEFT
            characterPlayAnim("boyfriend", "singRIGHT", true)
        elseif direction == 3 then -- RIGHT
            characterPlayAnim("boyfriend", "singLEFT", true)
        end
    else
        if direction == 0 then -- LEFT
            characterPlayAnim("boyfriend", "singLEFT", true)
        elseif direction == 3 then -- RIGHT
            characterPlayAnim("boyfriend", "singRIGHT", true)
        end
    end
end

function onUpdatePost(elapsed)
    local anim = getProperty("boyfriend.animation.curAnim.name")
    if anim == nil then return end

    local fixedAnim = anim
    if getProperty("boyfriend.flipX") then
        if string.find(anim, "singLEFT") then
            fixedAnim = anim:gsub("LEFT", "RIGHT")
        elseif string.find(anim, "singRIGHT") then
            fixedAnim = anim:gsub("RIGHT", "LEFT")
        end
    end

    if bfOffsets[fixedAnim] ~= nil then
        setProperty("boyfriend.offset.x", bfOffsets[fixedAnim].x)
        setProperty("boyfriend.offset.y", bfOffsets[fixedAnim].y)
    end

    if bfOffsets[anim] ~= nil then
        local ox = bfOffsets[anim].x
        local oy = bfOffsets[anim].y

        if getProperty("boyfriend.flipX") then
            ox = -ox
        end

        setProperty("boyfriend.offset.x", ox)
        setProperty("boyfriend.offset.y", oy)
    end
end