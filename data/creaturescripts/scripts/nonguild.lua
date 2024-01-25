
local from1,to1 = {x= 979, y=911, z= 7},{x= 994, y=919, z= 7} -- arena konoha
local from2,to2 = {x= 1161, y=1177, z= 7},{x= 1168, y=1189, z= 7}-- arena mist

function onCombat(cid, target)
local pos = getCreaturePosition(cid)
if not isPlayer(target) then return true end
if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) then
return true
end
if getTileInfo(getThingPos(cid)).pvp then return true end
	if (getPlayerGuildId(cid) ~= getPlayerGuildId(target)) or isPlayer(target) == false or getPlayerGuildId(cid) == nil or getPlayerGuildId(cid) <= 0 then
			return true
	end
			doPlayerSendCancel(cid, "Voce nao pode atacar players da mesma guild.")
			return false
end

function onTarget(cid, target)
local pos = getCreaturePosition(cid)
if not isPlayer(target) then return true end
if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) then
return true
end
if getTileInfo(getThingPos(cid)).pvp then return true end
	if (getPlayerGuildId(cid) ~= getPlayerGuildId(target)) or isPlayer(target) == false or getPlayerGuildId(cid) == nil or getPlayerGuildId(cid) <= 0 then
			return true
	end
			doPlayerSendCancel(cid, "Voce nao pode atacar players da mesma guild.")
			return false
end