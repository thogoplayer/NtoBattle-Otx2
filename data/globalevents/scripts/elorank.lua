function onThink(interval, lastExecution)
	local max, query = 5, db.getResult("SELECT `id`, `name`, `elo_points` FROM `players` WHERE `id` > 1 AND `group_id` < 2 ORDER BY `elo_points` DESC, `name` ASC;")
	local str = "TOP "..max.." Rank Elo Points:\n\n"
	if (query:getID() ~= -1) then 
		k = 1 
		while true do
			-- setGlobalStorageValue(15000+k, query:getDataInt("id"))
			str = str .. "\n " .. k .. " - "..query:getDataString("name").."["..query:getDataInt("elo_points").."]"
			k = k + 1
			if not(query:next()) or k > max then
				break 
			end 
		end 
		query:free()
	end
    doBroadcastMessage(str, 22)
	return true
end