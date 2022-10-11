function onUpdate(elapsed)
	if getProperty('health') > 0.06 then
		if dadName == 'majinsonic' then --replace the name for your character name
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'Majin_Notes')
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Majin_Notes'); --Change texture
				end
			end
		end
	end
end