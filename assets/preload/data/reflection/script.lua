lastConductorPos = 0;
function onSongStart()
	ogposx0 = getPropertyFromGroup('opponentStrums', 0, 'x');
	ogposy0 = getPropertyFromGroup('opponentStrums', 0, 'y');
	ogposx1 = getPropertyFromGroup('opponentStrums', 1, 'x');
	ogposy1 = getPropertyFromGroup('opponentStrums', 1, 'y');
	ogposx2 = getPropertyFromGroup('opponentStrums', 2, 'x');
	ogposy2 = getPropertyFromGroup('opponentStrums', 2, 'y');
	ogposx3 = getPropertyFromGroup('opponentStrums', 3, 'x');
	ogposy3 = getPropertyFromGroup('opponentStrums', 3, 'y');
	ogposx4 = getPropertyFromGroup('playerStrums', 0, 'x');
	ogposy4 = getPropertyFromGroup('playerStrums', 0, 'y');
	ogposx5 = getPropertyFromGroup('playerStrums', 1, 'x');
	ogposy5 = getPropertyFromGroup('playerStrums', 1, 'y');
	ogposx6 = getPropertyFromGroup('playerStrums', 2, 'x');
	ogposy6 = getPropertyFromGroup('playerStrums', 2, 'y');
	ogposx7 = getPropertyFromGroup('playerStrums', 3, 'x');
	ogposy7 = getPropertyFromGroup('playerStrums', 3, 'y');
end
function onUpdate(elapsed)
	ballssimulatorroblox = getSongPosition();
	if (0 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 0) then
			noteTweenX('balls0', 0 , ogposx0 + 14, 0.5 , 'quadInOut');
			noteTweenY('balls20', 0 , ogposy0 + -334, 0.5 , 'quadInOut');
			noteTweenAngle('balls30', 0 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls40', 0 , 1, 0.5 , 'quadInOut');
		end
	end
if (538.922155688623 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 538.922155688623) then
			noteTweenX('balls1', 1 , ogposx1 + 2, 0.5 , 'quadInOut');
			noteTweenY('balls21', 1 , ogposy1 + -336, 0.5 , 'quadInOut');
			noteTweenAngle('balls31', 1 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls41', 1 , 1, 0.5 , 'quadInOut');
		end
	end
if (1077.84431137725 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 1077.84431137725) then
			noteTweenX('balls2', 2 , ogposx2 + 2, 0.5 , 'quadInOut');
			noteTweenY('balls22', 2 , ogposy2 + -336, 0.5 , 'quadInOut');
			noteTweenAngle('balls32', 2 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls42', 2 , 1, 0.5 , 'quadInOut');
		end
	end
if (1796.40718562874 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 1796.40718562874) then
			noteTweenX('balls3', 3 , ogposx3 + 2, 0.5 , 'quadInOut');
			noteTweenY('balls23', 3 , ogposy3 + -336, 0.5 , 'quadInOut');
			noteTweenAngle('balls33', 3 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls43', 3 , 1, 0.5 , 'quadInOut');
		end
	end
if (2874.25149700599 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 2874.25149700599) then
			noteTweenX('balls4', 4 , ogposx4 + -8, 0.5 , 'quadInOut');
			noteTweenY('balls24', 4 , ogposy4 + -316, 0.5 , 'quadInOut');
			noteTweenAngle('balls34', 4 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls44', 4 , 1, 0.5 , 'quadInOut');
		end
	end
if (3413.17365269461 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 3413.17365269461) then
			noteTweenX('balls5', 5 , ogposx5 + 10, 0.5 , 'quadInOut');
			noteTweenY('balls25', 5 , ogposy5 + -316, 0.5 , 'quadInOut');
			noteTweenAngle('balls35', 5 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls45', 5 , 1, 0.5 , 'quadInOut');
		end
	end
if (3862.2754491018 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 3862.2754491018) then
			noteTweenX('balls6', 6 , ogposx6 + 10, 0.5 , 'quadInOut');
			noteTweenY('balls26', 6 , ogposy6 + -316, 0.5 , 'quadInOut');
			noteTweenAngle('balls36', 6 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls46', 6 , 1, 0.5 , 'quadInOut');
		end
	end
if (4670.65868263473 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 4670.65868263473) then
			noteTweenX('balls7', 7 , ogposx7 + 10, 0.5 , 'quadInOut');
			noteTweenY('balls27', 7 , ogposy7 + -316, 0.5 , 'quadInOut');
			noteTweenAngle('balls37', 7 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls47', 7 , 1, 0.5 , 'quadInOut');
		end
	end
if (2874.25149700599 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 2874.25149700599) then
			noteTweenX('balls2', 2 , ogposx2 + -740, 0.5 , 'quadInOut');
			noteTweenY('balls22', 2 , ogposy2 + -310, 0.5 , 'quadInOut');
			noteTweenAngle('balls32', 2 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls42', 2 , 1, 0.5 , 'quadInOut');
		end
	end
if (2874.25149700599 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 2874.25149700599) then
			noteTweenX('balls3', 3 , ogposx3 + -944, 0.5 , 'quadInOut');
			noteTweenY('balls23', 3 , ogposy3 + -304, 0.5 , 'quadInOut');
			noteTweenAngle('balls33', 3 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls43', 3 , 1, 0.5 , 'quadInOut');
		end
	end
if (2874.25149700599 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 2874.25149700599) then
			noteTweenX('balls0', 0 , ogposx0 + -902, 0.5 , 'quadInOut');
			noteTweenY('balls20', 0 , ogposy0 + -304, 0.5 , 'quadInOut');
			noteTweenAngle('balls30', 0 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls40', 0 , 1, 0.5 , 'quadInOut');
		end
	end
if (2874.25149700599 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 2874.25149700599) then
			noteTweenX('balls1', 1 , ogposx1 + -862, 0.5 , 'quadInOut');
			noteTweenY('balls21', 1 , ogposy1 + -304, 0.5 , 'quadInOut');
			noteTweenAngle('balls31', 1 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls41', 1 , 1, 0.5 , 'quadInOut');
		end
	end
if (5389.22155688623 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 5389.22155688623) then
			noteTweenX('balls4', 4 , ogposx4 + -580, 0.5 , 'quadInOut');
			noteTweenY('balls24', 4 , ogposy4 + -292, 0.5 , 'quadInOut');
			noteTweenAngle('balls34', 4 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls44', 4 , 1, 0.5 , 'quadInOut');
		end
	end
if (5389.22155688623 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 5389.22155688623) then
			noteTweenX('balls5', 5 , ogposx5 + -442, 0.5 , 'quadInOut');
			noteTweenY('balls25', 5 , ogposy5 + -288, 0.5 , 'quadInOut');
			noteTweenAngle('balls35', 5 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls45', 5 , 1, 0.5 , 'quadInOut');
		end
	end
if (5389.22155688623 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 5389.22155688623) then
			noteTweenX('balls6', 6 , ogposx6 + -246, 0.5 , 'quadInOut');
			noteTweenY('balls26', 6 , ogposy6 + -288, 0.5 , 'quadInOut');
			noteTweenAngle('balls36', 6 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls46', 6 , 1, 0.5 , 'quadInOut');
		end
	end
if (5389.22155688623 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 5389.22155688623) then
			noteTweenX('balls7', 7 , ogposx7 + -102, 0.5 , 'quadInOut');
			noteTweenY('balls27', 7 , ogposy7 + -286, 0.5 , 'quadInOut');
			noteTweenAngle('balls37', 7 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls47', 7 , 1, 0.5 , 'quadInOut');
		end
	end
if (5748.50299401198 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 5748.50299401198) then
			noteTweenX('balls4', 4 , ogposx4 + -320, 0.5 , 'quadInOut');
			noteTweenY('balls24', 4 , ogposy4 + 0, 0.5 , 'quadInOut');
			noteTweenAngle('balls34', 4 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls44', 4 , 1, 0.5 , 'quadInOut');
		end
	end
if (6197.60479041916 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 6197.60479041916) then
			noteTweenX('balls5', 5 , ogposx5 + -320, 0.5 , 'quadInOut');
			noteTweenY('balls25', 5 , ogposy5 + 0, 0.5 , 'quadInOut');
			noteTweenAngle('balls35', 5 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls45', 5 , 1, 0.5 , 'quadInOut');
		end
	end
if (6826.34730538922 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 6826.34730538922) then
			noteTweenX('balls6', 6 , ogposx6 + -320, 0.5 , 'quadInOut');
			noteTweenY('balls26', 6 , ogposy6 + 0, 0.5 , 'quadInOut');
			noteTweenAngle('balls36', 6 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls46', 6 , 1, 0.5 , 'quadInOut');
		end
	end
if (7544.91017964072 <= ballssimulatorroblox - 0.2) then
		if (lastConductorPos <= 7544.91017964072) then
			noteTweenX('balls7', 7 , ogposx7 + -320, 0.5 , 'quadInOut');
			noteTweenY('balls27', 7 , ogposy7 + 0, 0.5 , 'quadInOut');
			noteTweenAngle('balls37', 7 , 0, 0.5 , 'quadInOut');
			noteTweenAlpha('balls47', 7 , 1, 0.5 , 'quadInOut');
		end
	end

	lastConductorPos = getSongPosition();
   end
        missLimit = 10 --this is the miss limit, if you put the value 0 you will die instantly, so dont put 0
        cantDie = false --if the value is true you can only die by the miss limit
        showHealthBar = true --if the value is false the health bar will not be shown
        textSize = 30 --da text size