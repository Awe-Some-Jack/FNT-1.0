function onEvent(name, value1, value2)
    if name ~= "Set Camera Speed" then return end
    value1 = tonumber(value1)
    if value1 ~= nil then
        if 20 <= value1 then
            setOnScripts("instantCameraMove", true)
        else
            setOnScripts("instantCameraMove", false)
            setProperty("cameraSpeed", value1)
        end
    end
end
