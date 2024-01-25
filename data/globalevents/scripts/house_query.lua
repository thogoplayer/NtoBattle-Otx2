
-- Atualizar no Banco de Dados o Valor da House Id a cada 1 segund --

function onThink(interval, lastExecution)
	for k, v in pairs(getPlayersOnline()) do
		local cid = v
		if (getHouseByPlayerGUID(getPlayerGUID(cid)) ~= nil) then
			local resultado = db.getResult("SELECT `house_id` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. ";")
			if resultado:getID() ~= -1 then
				if resultado:getDataInt("house_id") == 0 then
					db.executeQuery("UPDATE `players` SET `house_id` = '" .. getHouseByPlayerGUID(getPlayerGUID(cid)) .. "' WHERE `id` = '" .. getPlayerGUID(cid) .. "';")
				end
			end
		end
	end
	return true
end