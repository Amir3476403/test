local canPause = true
local zoom = false

function onCreate()
	makeLuaSprite('blocky', 'blocky', -300, 0)
	addLuaSprite('blocky', false)
	scaleObject('blocky', 0.6, 0.6)
	doTweenColor('flash back', 'blocky', 'FF0000', 0.5, 'linear')

	makeLuaSprite('songImage', 'Image Song Name', 0, 0)
	addLuaSprite('songImage', false)
    setObjectCamera('songImage', 'other');
	setProperty('songImage.alpha', 0)

	makeLuaSprite('readya', 'readya', 450, 250);
	addLuaSprite('readya', false)
    	setObjectCamera('readya', 'other')
	scaleObject('readya', 0.5, 0.5)
	setProperty('readya.alpha', 0)

	makeLuaSprite('seta', 'seta', 450, 250);
	addLuaSprite('seta', false)
    	setObjectCamera('seta', 'other')
	scaleObject('seta', 0.5, 0.5)
	setProperty('seta.alpha', 0)

	makeLuaSprite('goa', 'goa', 375, 150);
	addLuaSprite('goa', false)
    	setObjectCamera('goa', 'other')
	scaleObject('goa', 0.85, 0.85)
	setProperty('goa.alpha', 0)

makeLuaText('watermark', "Coding and Charting by Herox", 1280, 0, 5);
    setTextSize('watermark', 75);
    setTextFont('watermark','sonic.ttf');
    addLuaText('watermark');
    setObjectCamera('watermark', 'other');
	setProperty('watermark.alpha', 0)

makeLuaText('watermark2', "Herox:\nEven if it's a concept, palinxx...\n\nI really loved listening to this song non-stop and thank you also for making this masterpiece song.\nI would really love to see more 'vs Cream' content from you! <3", 1280, 0, 5);
    setTextSize('watermark2', 50);
    setTextFont('watermark2', 'sonic.ttf');
    addLuaText('watermark2');
    setTextColor('watermark2', '00FF00');
    setObjectCamera('watermark2', 'other');
	screenCenter('watermark2')
	setProperty('watermark2.alpha', 0)

makeLuaText('watermark3', "Sprites by vs Cream Joke Mod Team and vs Sonic.EXE Team", 1280, 0, 100);
    setTextSize('watermark3', 35);
    setTextFont('watermark3','sonic.ttf');
    addLuaText('watermark3');
    setObjectCamera('watermark3', 'other');
	setProperty('watermark3.alpha', 0)

makeLuaText('countdownTextALT', "Ready, Cream?", 1280, 0, 600);
    setTextSize('countdownTextALT', 50);
    setTextFont('countdownTextALT','sonic2.ttf');
    addLuaText('countdownTextALT');
    setObjectCamera('countdownTextALT', 'other');
	setProperty('countdownTextALT.alpha', 0)

	-- MISCELLEANEOUS --

	makeLuaSprite('redscreen', 'redscreen', -50, 0);
	addLuaSprite('redscreen', false)
    	setObjectCamera('redscreen', 'other')
	scaleObject('redscreen', 6, 6)
	setProperty('redscreen.alpha', 0)

	makeLuaSprite('blackscreen', 'blackscreen', -50, 0);
	addLuaSprite('blackscreen', false)
    	setObjectCamera('blackscreen', 'other')
	scaleObject('blackscreen', 6, 6)

	makeLuaSprite('whitescreen', 'whitescreen', -50, 0);
	addLuaSprite('whitescreen', false)
    	setObjectCamera('whitescreen', 'other')
	scaleObject('whitescreen', 6, 6)
	setProperty('whitescreen.alpha', 0)

	setObjectOrder('blackscreen', 1)
	setObjectOrder('readya', 2)
	setObjectOrder('seta', 3)
	setObjectOrder('goa', 4)
end

function onCountdownTick(counter)
	if counter == 1 then
	setProperty('readya.alpha', 1)
	runTimer('two', 0.1)
	setProperty('countdownTextALT.alpha', 1)
	end

	if counter == 2 then
	setProperty('seta.alpha', 1)
	runTimer('one', 0.1)
	setTextString('countdownTextALT', "Prepare, Cream.")
	end

	if counter == 3 then
	setProperty('goa.alpha', 1)
	runTimer('go', 0.1)
	setTextString('countdownTextALT', "Bring it on, Cream!")
	end
end

function onUpdate()
triggerEvent('Camera Follow Pos', getProperty('gf.x'), getProperty('gf.y'))
--[[
Just learned this out, not only because it can be used as an alternate camera, BUT IT ALSO CAN DO CAMERA TWEENS WITH THIS METHOD!
by using doTweenX and/or Y, you can set the camera tween to whatever you want to be!

But just a heads out, I didn't know this was possible. I was wondering how this was possible so I went through "sing on the mountain" mod and noticed how this works.
so I thought it would be SUPER USEFUL for camera tweens instead of just seeing the camera being completely classic (as named that in FNF v3.0).
go wild!
- Herox, as of May 19th, 2024
]]

	if zoom == false then
	setProperty('camZooming', false)
	end

	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setTextFont('scoreTxt', 'sonic.ttf')
    	setTextFont('timeTxt','sonic2.ttf');

        --noteTweenX('bfTween1', 4, 95, 0.001, 'linear'); -- 90
        --noteTweenX('bfTween2', 5, 205, 0.001, 'linear'); -- 205
        --noteTweenX('bfTween3', 6, 315, 0.001, 'linear'); -- 315
        --noteTweenX('bfTween4', 7, 425, 0.001, 'linear'); -- 425
		-- i'm seperating it just to make sure that i dont screw this up (- Herox)
        noteTweenX('dadTween1', 0, 735, 0.001, 'linear'); -- 730
        noteTweenX('dadTween2', 1, 845, 0.001, 'linear'); -- 845
        noteTweenX('dadTween3', 2, 955, 0.001, 'linear'); -- 955
        noteTweenX('dadTween4', 3, 1065, 0.001, 'linear'); -- 1065
end

function onSongStart()
	setProperty('blocky.alpha', 0)
	setProperty('dad.alpha', 0)
	doTweenAlpha('credits start', 'watermark', 1, 2, 'linear')
	doTweenAlpha('credits start2', 'watermark3', 1, 2, 'linear')
	setProperty('scoreTxt.alpha', 0)
	doTweenAlpha('countdownTextALT', 'countdownTextALT', 0, 0.5)

        noteTweenX('bfTween1', 4, 400, 0.5, 'bounceOut');
        noteTweenX('bfTween2', 5, 510, 0.5, 'bounceOut');
        noteTweenX('bfTween3', 6, 620, 0.5, 'bounceOut');
        noteTweenX('bfTween4', 7, 730, 0.5, 'bounceOut');

	noteTweenAlpha("NoteAlpha1", 0, 0, 0.25, 'expoOut')
	noteTweenAlpha("NoteAlpha2", 1, 0, 0.25, 'expoOut')
	noteTweenAlpha("NoteAlpha3", 2, 0, 0.25, 'expoOut')
	noteTweenAlpha("NoteAlpha4", 3, 0, 0.25, 'expoOut')
end

function onPause()
	if canPause == false then
	return Function_Stop;
	end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'songByes' then
		doTweenY('adios song!', 'songImage', 200, 1, 'quadIn')
	end

	if tag == 'two' then
	doTweenAlpha('readya', 'readya', 0, 0.3)
	end

	if tag == 'one' then
	doTweenAlpha('seta', 'seta', 0, 0.3)
	end

	if tag == 'go' then
	doTweenAlpha('goa', 'goa', 0, 0.3)
	end
end

function onBeatHit()
	if curBeat == 6 then
	doTweenAlpha('nope', 'watermark', 0, 3, 'linear')
	doTweenAlpha('nopeaswell', 'watermark3', 0, 3.25, 'linear')
	end

	if curBeat == 12 then
	doTweenAlpha('bye black screen', 'blackscreen', 0, 1, 'linear')
	end

	if curBeat == 52 then
	doTweenAlpha('bye hud', 'camHUD', 0, 0.5, 'linear')
	end

	if curBeat == 127 then
    	setObjectCamera('blackscreen', 'camHUD')
	setProperty('blackscreen.alpha', 1)
	doTweenAlpha('boo', 'redscreen', 0.2, 0.25, 'linear')
	setProperty('redscreen.alpha', 0.1)
	end

	if curBeat == 128 then
	setProperty('blackscreen.alpha', 0)
	setProperty('redscreen.alpha', 0)
    	setObjectCamera('blackscreen', 'other')
	setProperty('songImage.alpha', 1)
	cameraFlash('camera', 'FFFFFF', 0.5)
	setProperty('blocky.alpha', 1)
	runTimer('songByes', 3)
	setProperty('scoreTxt.alpha', 1)
	canPause = true
	end

	if curBeat == 354 then
	zoom = false
	end
end

function onStepHit()
	if curStep > 2509 then
	setProperty('blackscreen.alpha', 1)
	setProperty('watermark2.alpha', 1)
	doTweenColor('ending', 'watermark2', 'FFFFFF', 1, 'linear')
	end

	if curStep == 2510 then
	cameraShake('other', 0.0015, 0.5)
	end

	if curStep == 1546 or curStep == 1550 then
	setProperty('blackscreen.alpha', 1)
	end

	if curStep == 1548 or curStep == 1552 then
	setProperty('blackscreen.alpha', 0)
	end
end

function onSectionHit()
	if curSection == 16 or curSection == 18 or curSection == 20 or curSection == 22 then
	setProperty('redscreen.alpha', 0.5)
	doTweenAlpha('sections here', 'redscreen', 0, 1, 'linear')
	end

	if curSection == 23 then
	doTweenAlpha('appears here', 'camHUD', 1, 0.5, 'linear')
	end

	if curSection == 47 or curSection == 65 or curSection == 80 or curSection == 112 or curSection == 120 or curSection == 136 then
	zoom = false
	end

	if curSection == 48 then
	doTweenAlpha('alright', 'blackscreen', 0.5, 1, 'linear')
	end

	if curSection == 49 or curSection == 81 or curSection == 89 or curSection == 121 then
	setProperty('blackscreen.alpha', 0)
	setProperty('whitescreen.alpha', 0.75)
	doTweenAlpha('flashed', 'whitescreen', 0, 0.5, 'linear')
	zoom = true
	end

	if curSection == 69 or curSection == 113 then
	zoom = true
	end

	if curSection == 105 then
	setProperty('whitescreen.alpha', 0.75)
	doTweenAlpha('flashed', 'whitescreen', 0, 0.5, 'linear')
	end

	if curSection == 97 then
	setProperty('whitescreen.alpha', 0.5)
	doTweenAlpha('flashed', 'whitescreen', 0, 0.5, 'linear')
	end

	if curSection == 136 then
	zoom = true
	end

	if curSection == 137 then
	setProperty("defaultCamZoom", 1.3)
	end
end

function onEvent(event, v1, v2)
	if event == 'tails doll appears out of nowhere' then
	doTweenX('move your camera mf', 'gf', 550, 1, 'quadInOut')
        noteTweenX('bfTween1', 4, 95, 0.85, 'quadInOut'); -- 90
        noteTweenX('bfTween2', 5, 205, 0.85, 'quadInOut'); -- 205
        noteTweenX('bfTween3', 6, 315, 0.85, 'quadInOut'); -- 315
        noteTweenX('bfTween4', 7, 425, 0.85, 'quadInOut'); -- 425
	end

	if event == 'he appears now' then
	setProperty('dad.alpha', 1)
	noteTweenAlpha("NoteAlpha1", 0, 1, 0.25, 'expoOut')
	noteTweenAlpha("NoteAlpha2", 1, 1, 0.25, 'expoOut')
	noteTweenAlpha("NoteAlpha3", 2, 1, 0.25, 'expoOut')
	noteTweenAlpha("NoteAlpha4", 3, 1, 0.25, 'expoOut')
	cameraFlash('camera', 'FFFFFF', 0.5)
	zoom = true
	end
end