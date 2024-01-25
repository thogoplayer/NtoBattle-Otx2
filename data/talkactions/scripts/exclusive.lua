local effects = {
	["fogos"] = {bar = 2, storage = 7128140},
	["escuro"] = {bar = 3, storage = 7128141},
	["rainbow"] = {bar = 4, storage = 7128142},
	["ghost"] = {bar = 5, storage = 7128143},
	["bow"] = {bar = 6, storage = 7128144},	
}

local config = {
	storageRunning = 712813,
}

local function runAura(cid, bar)
	if isCreature(cid) then
		doSetHealthBackgroundOutfit(cid, bar)
	else
		return false
	end
return true
end

function onSay(cid, words, param)
	local t = string.explode(param, ",")
	if(not t[1]) then
		local bars = ""
		for k, v in pairs(effects) do
			if getPlayerStorageValue(cid, v.storage) >= 1 then
				bars = bars .. k .. ", "
			end
		end

		if bars ~= "" then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Suas bar disponiveis s�o: " .. string.sub(bars, 1, -3) .. ".")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não possui nenhuma aura disponivel.")
		end
		return true
	end


	local bar = effects[t[1]]

	if bar then
		if getPlayerStorageValue(cid, bar.storage) >= 1 then
			if getPlayerStorageValue(cid, config.storageRunning) ~= 1 then
				setPlayerStorageValue(cid, config.storageRunning, 1)
				runAura(cid, bar.bar)
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce ja esta com uma bar ativa. Para desativa-la, basta relogar.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao possui essa bar. Para adquiri-la, acesse o shop.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Comando invalido.")
	end
	return true
end