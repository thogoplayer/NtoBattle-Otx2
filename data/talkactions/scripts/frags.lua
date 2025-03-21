local config = {
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler')),
	advancedFragList = getBooleanFromString(getConfigValue('advancedFragList'))
}

function onSay(cid, words, param, channel)
	if(not config.useFragHandler) then
		return false
	end

	local time = os.time()
	local times = {today = (time - 86400), week = (time - (7 * 86400))}

	local contents, result = {day = {}, week = {}, month = {}}, db.getResult("SELECT `pd`.`date`, `pd`.`level`, `p`.`name` FROM `player_killers` pk LEFT JOIN `killers` k ON `pk`.`kill_id` = `k`.`id` LEFT JOIN `player_deaths` pd ON `k`.`death_id` = `pd`.`id` LEFT JOIN `players` p ON `pd`.`player_id` = `p`.`id` WHERE `pk`.`player_id` = " .. getPlayerGUID(cid) .. " AND `k`.`unjustified` = 1 AND `pd`.`date` >= " .. (time - (30 * 86400)) .. " ORDER BY `pd`.`date` DESC")
	if(result:getID() ~= -1) then
		repeat
			local content = {
				name = result:getDataString("name"),
				level = result:getDataInt("level"),
				date = result:getDataInt("date")
			}
			if(content.date > times.today) then
				table.insert(contents.day, content)
			elseif(content.date > times.week) then
				table.insert(contents.week, content)
			else
				table.insert(contents.month, content)
			end
		until not result:next()
		result:free()
	end

	local size = {
		day = table.maxn(contents.day),
		week = table.maxn(contents.week),
		month = table.maxn(contents.month)
	}
	if(config.advancedFragList) then
		local result = "Frags ganhos no dia: " .. size.day .. "."
		if(size.day > 0) then
			for _, content in ipairs(contents.day) do
				result = result .. "\n* " .. os.date("%d %B %Y %X at ", content.date) .. content.name .. " no level " .. content.level
			end

			result = result .. "\n"
		end

		result = result .. "\nFrags ganhos na semana: " .. (size.day + size.week) .. "."
		if(size.week > 0) then
			for _, content in ipairs(contents.week) do
				result = result .. "\n* " .. os.date("%d %B %Y %X at ", content.date) .. content.name .. " no level " .. content.level
			end

			result = result .. "\n"
		end

		result = result .. "\nFrags ganhos no m�s: " .. (size.day + size.week + size.month) .. "."
		if(size.month > 0) then
			for _, content in ipairs(contents.month) do
				result = result .. "\n* " .. os.date("%d %B %Y %X at ", content.date) .. content.name .. " no level " .. content.level
			end

			result = result .. "\n"
		end

		local skullEnd = getPlayerSkullEnd(cid)
		if(skullEnd > 0) then
			result = result .. "\nSeu " .. (getCreatureSkullType(cid) == SKULL_RED and "red" or "black") .. " skull expira em " .. os.date("%d %B %Y %X", skullEnd)
		end

		doPlayerPopupFYI(cid, result)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� possui " .. size.day .. " frags no dia, " .. (size.day + size.week) .. " na semana e " .. (size.day + size.week + size.month) .. " no m�s.")
		if(size.day > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu ultimo frag foi " .. os.date("%d %B %Y %X", contents.day[1].date) .. " no level " .. contents.day[1].level .. " (" .. contents.day[1].name .. ").")
		end

		local skullEnd = getPlayerSkullEnd(cid)
		if(skullEnd > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu " .. (getCreatureSkullType(cid) == SKULL_RED and "red" or "black") .. " skull expira em " .. os.date("%d %B %Y %X", skullEnd))
		end
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Frags-Red Skull: Dia = 25")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Frags-Black Skull: Dia = 35")

	return true
end
