function onCreatePost()
	if (not downscroll) then
		makeLuaSprite('customHealthBar', 'TS_healthbar', 0, 0)
		setObjectCamera('customHealthBar', 'hud')
		scaleObject('customHealthBar', 1, 1)
		setScrollFactor('customHealthBar', 0.9, 0.9)
		setObjectOrder('customHealthBar', 4)
		setObjectOrder('healthBar', 3)
		setObjectOrder('healthBarBG', 2)
		addLuaSprite('customHealthBar', true)
		setProperty('customHealthBar.x', 340)
		setProperty('customHealthBar.y', 640)
	else
		makeLuaSprite('customHealthBar', 'TS_healthbar', 0, 0)
		setObjectCamera('customHealthBar', 'hud')
		scaleObject('customHealthBar', 0.98, 0.73)
		setScrollFactor('customHealthBar', 0.9, 0.9)
		setObjectOrder('customHealthBar', 4)
		setObjectOrder('healthBar', 3)
		setObjectOrder('healthBarBG', 2)
		addLuaSprite('customHealthBar', true)
		setProperty('customHealthBar.x', 335)
		setProperty('customHealthBar.y', 69)
	end
    
end