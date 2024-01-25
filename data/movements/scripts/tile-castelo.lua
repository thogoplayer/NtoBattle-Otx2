function onStepIn(cid, item, position, fromPosition)
	
	local pos_principal = {x=1024, y=905, z=7}, {x=1025, y=905, z=7}, {x=1026, y=905, z=7} -- EDITAR POSIÇÃO DO TEMPLO
	local storage_guild = getGlobalStorageValue(6464) -- A 3ª storage configurada em Castle.lua
	
	if getPlayerGuildId(cid) ~= storage_guild then
		doTeleportThing(cid, pos_principal)
		doPlayerSendTextMessage(cid, 22, "Este castelo nao pertence a sua guild")
	end
	
	return true
end