local tsuku = {x = 1993, y = 3554, z = 6}
local alvo = {x = 1993, y = 3551, z = 6}
local area = {{x = 1987, y = 3548, z = 6},{x = 1999, y = 3557, z = 6}}  -- genjutsu shisui
local danosTarget = 40 -- %
local exhaust = 90

local function genjutsu_Return(cid, pos, danos)
if isCreature(cid) and isInRange(getCreaturePosition(cid), area[1], area[2]) then
doCreatureSetNoMove(cid, false)
doTeleportThing(cid, pos)
doCreatureAddHealth(cid, -(getCreatureMaxHealth(cid)/100*danos))
end
end

function onCastSpell(cid, var) if isSelado(cid) then return false end
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)

if isInRange(pos, area[1], area[2]) then
doPlayerSendCancel(cid, "Você ja esta no Genjutsu!")
return false
end

if getCreatureIn(cid, AREA_GENJUTSU) or getCreatureIn(cid, AREA_GGN) or getCreatureIn(cid, AREA_KAMUI) or getCreatureIn(cid, AREA_ARENA) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Voce nao pode usar o Genjutsu aqui!")
return false
end

if getTileInfo(getThingPos(cid)).pvp then
doPlayerSendCancel(cid, "Voce nao pode usar o Genjutsu aqui!")
return false
end

if exhaustion.check(cid, 13132) == true then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, 13132) .. " segundos para usar novamente.")
return false
end

if not isPlayer(target) then doPlayerSendCancel(cid, "Use apenas em players.") return false end
if isLimboProtection(cid, target) then return exhaustion.set(cid, 13132, exhaust) end

exhaustion.set(cid, 13132, exhaust)
doTeleportThing(cid,tsuku)
doTeleportThing(target,alvo)
doCreatureSetNoMove(target, true)
doCreatureSetNoMove(cid, true)
doSendMagicEffect(alvo, 221)
addEvent(genjutsu_Return, 6000, cid, pos, 0)
addEvent(genjutsu_Return, 6000, target, targetpos, danosTarget)
return true
end