local waittime = 5.0 -- Tempo de exhaustion
local storage = 937451
local storagekatana = 937452

local function removeKatana(cid, pos)
doTeleportThing(cid, pos)
local wall = getTileItemById(pos, 14007).uid
if wall > 0 then
local s = doPlayerAddItem(cid, 10524)
doItemSetAttribute(s, "description", "Owner: " .. getCreatureName(cid))
doItemSetAttribute(s, "dono", getCreatureName(cid))
setPlayerStorageValue(cid, 15500, 0)
doRemoveItem(wall, 1)
end
end


function onCastSpell(cid, var)
if not exhaustion.check(cid, storagekatana) then
doPlayerSendCancel(cid, "Kusanagi não foi marcada")
return false
end

exhaustion.set(cid, storage, waittime)
removeKatana(cid, getPos(cid, 15501))
exhaustion.set(cid, 937452, -1)
doSendMagicEffect(getCreaturePosition(cid), 640)
return true
end