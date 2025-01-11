function onCreate()
	makeLuaSprite("cineUp", nil, 0, -100)
	makeGraphic("cineUp", 1280, 100, "000000")
	setObjectCamera("cineUp", "camHUD")
	setObjectOrder("cineUp", "0")
	addLuaSprite("cineUp")

	makeLuaSprite("cineDown", nil, 0, 720)
	makeGraphic("cineDown", 1280, 100, "000000")
	setObjectCamera("cineDown", "camHUD")
	setObjectOrder("cineDown", "0")
	addLuaSprite("cineDown")
end

function onEvent(name, v1, v2)
	if name == "Cinematics" then
		if v1 == "1" then
			doTweenY("cineUpTween", "cineUp", 0, 1, "quadOut")
			doTweenY("cineDownTween", "cineDown", 620, 1, "quadOut")
		elseif v1 == "0" then
			doTweenY("cineUpTween", "cineUp", -100, 1, "quadOut")
			doTweenY("cineDownTween", "cineDown", 720, 1, "quadOut")
		end
	end
end
