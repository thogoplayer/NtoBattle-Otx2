local positions=	{
{x = 1960, y = 687, z = 6},
{x = 1960, y = 689, z = 5},
{x = 1962, y = 700, z = 5},
{x = 1960, y = 719, z = 5},
{x = 1988, y = 699, z = 5},
{x = 2017, y = 701, z = 6},
{x = 1994, y = 701, z = 6},
{x = 1956, y = 719, z = 6},
{x = 1974, y = 670, z = 6},
{x = 1956, y = 700, z = 6},
{x = 1950, y = 656, z = 7},
{x = 1943, y = 674, z = 7},
{x = 1981, y = 671, z = 7},
{x = 1998, y = 673, z = 7},
{x = 1947, y = 717, z = 7},
{x = 1973, y = 726, z = 7},
{x = 2008, y = 701, z = 7},
{x = 2020, y = 720, z = 7},
{x = 1962, y = 728, z = 7}
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
doPlayerSendCancel(cid, "Você nao pode usar o Kamui Me aqui!!")
return false
end

if exhaustion.check(cid, storage) == true then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar novamente.")
return false
end

if getCreatureIn(cid, AREA_KAMUI) then
doPlayerSendCancel(cid, "Você ja esta dentro do Kamui Me!!")
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
doItemSetAttribute(tp, "aid", 5561)
doTeleportThing(cid, pos_select)
if target and isPlayer(target) then
savePos(target, 5020)
exhaustion.set(target, 5570, 30)
doTeleportThing(target, pos_select)
end
addEvent(removeTeleport, 10000, pos)
return true
end

