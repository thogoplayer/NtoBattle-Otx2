--[[
Online Points System.
Version : v1.0
]]--

function onLogin(cid)
if getPlayerStorageValue(cid, 3000) < 0 then
setPlayerStorageValue(cid, 3000, 0)
end
doCreatureSetStorage(cid, 1219, os.time())
return true
end

function onLogout(cid)
doCreatureSetStorage(cid, 1219, 0)
return true
end