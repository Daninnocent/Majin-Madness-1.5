function onCreate()
	-- background shit
	makeLuaSprite('MajinBG', 'MajinBG', -600, -300);
	setScrollFactor('MajinBG', 0.9, 0.9);

	addLuaSprite('MajinBG', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end