function onEvent(n,v1,v2)


	if n == 'Flash Camera' then

	    makeLuaSprite('flash', '', 0, 0)
        makeGraphic('flash', screenWidth, screenHeight, 'ffffff')
		setObjectCamera("flash", "hud")
	    addLuaSprite('flash')
	    setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,v1,'linear')
	end



end