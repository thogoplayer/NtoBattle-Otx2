function onLogin(cid)
registerCreatureEvent(cid, "Limbo")
return true
end

function onLogout(cid)
local limbo = getPlayerStorageValue(cid, 532332)
local name = getCreatureName(cid)
if limbo > 0 then
setPlayerStorageValue(cid, 532332, -1)
RemoveLimbo(limbo, name)
end
return true
end