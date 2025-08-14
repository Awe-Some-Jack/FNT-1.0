--original made by Cherif, rewritten by TheConcealedCow to utilize 0.6.0's addAnimation function. (btw thank to this guy for this script, he's the original creator
folderName = 'icons'; --defaulted to mods/images/icons --btw u can chose if u select mods or assets just replace it
iconName = 'icon-puppy'; --name of png for icon
iconTag = 'P3'; --tag for the icon if you're doing multiples icons
antialiasing = true; --whether the icon is smoothed out or not
P = 1; --which icon the extra icon will attach to, if P1 will be in bf side, if its P2, will be in Opp Side
iconWidth = 150; --width and height values for the icon
iconHeight = 150;
Xoffset = 70; --x and y offsets
Yoffset = -30;
Xscale = 1; --scaling for icons
Yscale = 1;
overIcon = true; -- if yes, icon will be in top of the player icon

---------------------------------------don't edit anything under this line unless you know what you're doing
nofunc = false
normalfunc = true
boundIconName = 'iconP' .. P;
function onCreatePost()
	luaDebugMode = false
	isAnti = getPropertyFromClass('ClientPrefs', 'globalAntialiasing');
	makeAnimatedLuaSprite(iconTag);
	loadGraphic(iconTag, folderName .. '/' .. iconName, iconWidth, iconHeight);
	addAnimation(iconTag, 'icons', {0, 1, 2}, 0);
	setProperty(iconTag .. '.antialiasing', (isAnti and antialiasing));
	setProperty(iconTag .. '.y', (getProperty(boundIconName .. '.y') + Yoffset));
	setProperty(iconTag .. '.flipX', (P == 1));
	setObjectCamera(iconTag, 'hud');
	addToGroup('uiGroup', iconTag, getObjectOrder('iconP1', 'uiGroup'))
	setObjectOrder(iconTag, getObjectOrder(boundIconName) + (overIcon and 19));
	scaleObject(iconTag, Xscale, Yscale);
	addLuaSprite(iconTag, true);
end

function onUpdatePost()
	if normalfunc and not nofunc then
		setProperty(iconTag .. '.animation.curAnim.curFrame', getProperty(boundIconName .. '.animation.curAnim.curFrame'));
		setProperty(iconTag .. '.x', getProperty(boundIconName ..'.x')+Xoffset);
		setProperty(iconTag .. '.scale.x', getProperty(boundIconName ..'.scale.x') * Xscale);
		setProperty(iconTag .. '.scale.y', getProperty(boundIconName ..'.scale.y') * Yscale);
	elseif not normalfunc and not nofunc then
		setProperty(iconTag .. '.animation.curAnim.curFrame', getProperty('iconP1.animation.curAnim.curFrame'));
		if downscroll then
			setProperty(iconTag .. '.x', getProperty('iconP1.x')+60);
			setProperty(iconTag .. '.y', getProperty('iconP1.y')+55);
		else
			setProperty(iconTag .. '.x', getProperty('iconP1.x')+85);
			setProperty(iconTag .. '.y', getProperty('iconP1.y')-55);
		end
		setProperty(iconTag .. '.scale.x', getProperty('iconP1.scale.x') * Xscale);
		setProperty(iconTag .. '.scale.y', getProperty('iconP1.scale.y') * Yscale);
	end
end

function onEvent(n, v1, v2)
	if n == 'iconMove' then
		nofunc = true
		if downscroll then
			doTweenX('iconx', iconTag, getProperty('iconP1.x')+60, 0.3, 'cubeOut');
			doTweenY('icony', iconTag, getProperty('iconP1.y')+55, 0.3, 'cubeOut');
		else
			doTweenX('iconx', iconTag, getProperty('iconP1.x')+85, 0.3, 'cubeOut');
			doTweenY('icony', iconTag, getProperty('iconP1.y')-55, 0.3, 'cubeOut');
		end
		runTimer('prepare', 0.15);
	end
end

function onTimerCompleted(t)
	if t == 'prepare' then
		setProperty(iconTag .. '.flipX', true);
		setProperty(iconTag .. '.animation.curAnim.curFrame', getProperty('iconP1.animation.curAnim.curFrame'));
		setObjectOrder(iconTag, getObjectOrder('iconP1'));
		runTimer('finisher', 0.15); --too lazy for ontweencompleted
	end
	if t == 'finisher' then
		normalfunc = false
		nofunc = false
	end
end