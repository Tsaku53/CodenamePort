function onUpdate(elapsed)
misses = getProperty('songMisses')
	if misses >10 then
		setProperty('health', 0)
	end
end