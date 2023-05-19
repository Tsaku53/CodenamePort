function onUpdate(elapsed)
misses = getProperty('songMisses')
	if misses >5 then
		setProperty('health', 0)
	end
end