local config = {
-- max = getConfigValue('MaxPlayersPorIP'), -- Número de players permitido com o mesmo IP.
max = 6,
group_id = 3 -- Kikar apenas player com o group id 1.
}

local accepted_ip_list = {"170.79.32.95","177.223.164.61"} -- Lista dos players permitidos a usar MC, exemplo: {"200.85.3.60", "201.36.5.222"}

local function antiMC(pid, limit)
if isCreature(pid) and #getPlayersByIp(getPlayerIp(pid)) >= limit then
doRemoveCreature(pid)
end
return true
end

function onLogin(cid)
if getPlayerGroupId(cid) <= config.group_id then
if isInArray(accepted_ip_list,doConvertIntegerToIp(getPlayerIp(cid))) == false then
addEvent(antiMC, 1000, cid, config.max+1)
end
end
return true
end