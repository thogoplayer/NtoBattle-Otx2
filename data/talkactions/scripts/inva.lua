function isWalkable(pos) -- by Nord / editado por Omega
	if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then
		return false
	elseif isCreature(getTopCreature(pos).uid) then
		return false
	elseif getTileInfo(pos).protection then
		return false
	elseif hasProperty(getThingFromPos(pos).uid, 3) or hasProperty(getThingFromPos(pos).uid, 7) then
		return false
	end
	return true
end
local positions = {
		{x= 2066, y=2061, z= 7},
		{x= 2067, y=2061, z= 7},
		{x= 2068, y=2061, z= 7},
		{x= 2069, y=2061, z= 7},
		{x= 2070, y=2061, z= 7}
	}
function onSay(cid)
	if getPlayerAccess(cid) < 2 then
		return true
	end
	for i = 1, #positions do
		if isWalkable(positions[i]) then
			doCreateMonster(i == 1 and 'Renegade' or 'Nukenin', positions[i])
		end
	end	
	return broadcastMessage("Oh nao , Pokemons misteriosos estao invadiando saffron corra para proteger a cidade", MESSAGE_EVENT_ADVANCE)
end