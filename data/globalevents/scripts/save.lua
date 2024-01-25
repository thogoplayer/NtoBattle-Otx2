local config = {
	broadcast = {120, 30},
	shallow = "no",
	delay = 120,
	events = 30
}

config.shallow = getBooleanFromString(config.shallow)

local function executeSave(seconds)
	if(isInArray(config.broadcast, seconds)) then
		local text = ""
		if(not config.shallow) then
			text = "Full save server!"
		else
			text = "[Save]"
		end

		text = text .. "Servidor salvo dentro " .. seconds .. " Segundos, lembre-se de que pode congelar!"
		doBroadcastMessage(text)
	end

	if(seconds > 0) then
		addEvent(executeSave, config.events * 1000, seconds - config.events)
	else
		doSaveServer()
	end
end

function onThink(interval, lastExecution, thinkInterval)
	if(table.maxn(config.broadcast) == 0) then
		doSaveServer()
	else
		executeSave(config.delay)
	end

	return true
end
