local function EffectSharingan(pos)
for k = 0, 10 do
addEvent(doSendMagicEffect, k*900, pos, 259)
end
end


local function iza_return(uid, pos, danos)
return isCreature(uid) and doTeleportThing(uid, pos) and doCreatureAddHealth(uid, -(getCreatureMaxHealth(uid)/100*danos))
end

local cooldown = 90
local time = 10 -- tempo em segundos que vai ficar la dentro
local anyPos = {x= 2181, y=3574, z= 7}
local anyPos3 = {x= 2187, y=3574, z= 7}

local alvo = {x = 2109, y = 3592, z = 7}

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
-- local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local t_Pos = getCreaturePosition(target)


if getCreatureIn(cid, AREA_KAMUI) or getCreatureIn(cid, AREA_ARENA) or getCreatureIn(cid, AREA_GENJUTSU) or getCreatureIn(cid, AREA_GGN) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Você nao pode usar o Izanami aqui!")
return false
end

if getTileInfo(getThingPos(cid)).pvp then
doPlayerSendCancel(cid, "Você nao pode usar o Izanami aqui!")
return false
end

if exhaustion.check(cid, 12131) == true then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, 12131) .. " segundos para usar novamente.")
return false
end
if not isPlayer(target) then doPlayerSendCancel(cid, "Use apenas em players.") return false end
if isLimboProtection(cid, target) then return exhaustion.set(cid, 12131, cooldown) end

exhaustion.set(cid, 12131, cooldown)
-- EffectSharingan(pos)
EffectSharingan(t_Pos)
addEvent(iza_return, time*1000, target, t_Pos, 25)

local summonOne = doCreateMonster("croni", anyPos)
setCreatureMaxHealth(summonOne, getCreatureMaxHealth(target))
doCreatureAddHealth(summonOne, getCreatureHealth(target))
doSetCreatureOutfit(summonOne, getCreatureOutfit(target), -1)
setCreatureName(summonOne, getCreatureName(target), "a " .. getCreatureName(target))
addEvent(doTeleportThing, 50, summonOne, t_Pos)
addEvent(removeCreature, time*1000, summonOne)


local summonTwo = doCreateMonster("crone", anyPos3)
setCreatureMaxHealth(summonTwo, getCreatureMaxHealth(cid))
doCreatureAddHealth(summonTwo, getCreatureHealth(cid))
doSetCreatureOutfit(summonTwo, getCreatureOutfit(cid), -1)
setCreatureName(summonTwo, getCreatureName(cid), "a " .. getCreatureName(cid))
addEvent(doTeleportThing, 50, summonTwo, {x= 2109, y=3589, z= 7})
addEvent(removeCreature, time*1000, summonTwo)


doTeleportThing(target,alvo)
doSendMagicEffect(alvo, 259)
return true
end