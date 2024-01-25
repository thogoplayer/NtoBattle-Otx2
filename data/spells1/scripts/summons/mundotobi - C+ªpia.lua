local teleportar_para = {x = 1248, y = 730, z = 6}
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
function removeTeleport(pos)
tp = getTileItemById(pos, 1387).uid
doRemoveItem(tp, 1)
doSendMagicEffect(pos, 2)
end
function x(p, d)
local t = {{x=p.x,y=p.y-1,z=p.z},{x=p.x+1,y=p.y,z=p.z},{x=p.x,y=p.y+1,z=p.z},{x=p.x-1,y=p.y,z=p.z}}
return t[d+1]
end
function onCastSpell(cid, var)
if getPlayerStorageValue(cid, 5677) == 1 then
doPlayerSendCancel(cid, "Você não pode usar tal magia aqui")
return false
end
local pos = getCreaturePosition(cid)
local criar_tp = x(pos, getCreatureLookDir(cid))
doCreateTeleport(1387, teleportar_para, criar_tp)
local tp = getTileItemById(criar_tp, 1387).uid
doItemSetAttribute(tp, "aid", 5678)
--doTeleportThing(cid, teleportar_para, false) --Tira essa linha se nao for teleportar o player q usou a magia automaticamente.
for i = 1, 5 do
addEvent(doSendMagicEffect, i*1000, criar_tp, 134)
end
addEvent(removeTeleport, 5000, criar_tp)
return doCombat(cid, combat, var)
end