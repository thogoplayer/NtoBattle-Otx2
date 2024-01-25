local positions=	{
{x = 2873, y = 2934, z = 6},
{x = 2898, y = 2914, z = 6},
{x = 2907, y = 2951, z = 6},
{x = 2929, y = 2933, z = 6},
{x = 2951, y = 2891, z = 6},
{x = 2932, y = 2911, z = 5},
{x = 2887, y = 2928, z = 5},
{x = 2918, y = 2938, z = 4}
}

function removeTeleport(pos)
tp = getTileItemById(pos, 1387).uid
if tp > 0 then
doRemoveItem(tp, 1)
doSendMagicEffect(pos, 2)
end
end

function onCastSpell(cid, var) if isSelado(cid) then return false end
local waittime = 90
local storage = 5571
if getPlayerStorageValue(cid, 16700) > 1 then
doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!")
return false
end

if getCreatureIn(cid, AREA_ARENA) or getCreatureIn(cid, AREA_GENJUTSU) or getCreatureIn(cid, AREA_GGN) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Você nao pode usar esse jutsu aqui!!")
return false
end

if exhaustion.check(cid, storage) == true then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar novamente.")
return false
end

if getCreatureIn(cid, AREA_KAMUI) then
doPlayerSendCancel(cid, "Voce ja mudou de dimensão!!")
return false
end


local pos_select = positions[math.random(1, #positions)]
local target = getCreatureTarget(cid)
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
exhaustion.set(cid, 5570, 20)
doSendMagicEffect(pos_select, 196)
savePos(cid, 5020)
doCreateTeleport(1387, positions[math.random(1, #positions)], pos)
local tp = getTileItemById(pos, 1387).uid
doItemSetAttribute(tp, "aid", 5861)
doTeleportThing(cid, pos_select)
if target and isPlayer(target) then
savePos(target, 5020)
exhaustion.set(target, 5570, 30)
doTeleportThing(target, pos_select)
end
addEvent(removeTeleport, 10000, pos)
return true
end

