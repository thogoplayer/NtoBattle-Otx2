local config = { 
storage = 6425223,
exausted = 42522,
cooldown = 60,  --- tempo entre um uso e outro
duration = 7, --- duração
effect1 = 56, -- efeito que sai ao falar a spell
c_Posistion = {x = 2047, y = 3562, z = 7}, -- onde o player sera teleportado
t_Posistion = {x = 2047, y = 3559, z = 7}-- onde o player target teleportado
} 

local from1,to1 = {x = 1281, y = 702, z = 6},{x = 1298, y = 716, z = 6} -- ponto 1 ao ponto 2 da area em que ele sera teleportado


function returnGenjutsu(uid, ghost)
if isCreature(uid) then
if ghost then
doCreatureExecuteTalkAction(uid, "/ghost", true)
setPlayerGroupId(uid, 1)
end
doTeleportThing(uid, getPos(uid, 14501))
end
end


function onCastSpell(cid, var)
if getPlayerStorageValue(cid, 16700) > 1 then
doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!")
return false
end

local c_Pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
if isInRange(c_Pos, from1, to1) then
doPlayerSendCancel(cid, "Você nao pode usar esta spell aqui!")
return false
end

if exhaustion.check(cid, config.exausted) then
local seetime = exhaustion.get(cid, config.exausted)
doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar novamente o Kamui Muzan!")
return false
end
if not isPlayer(target) then doPlayerSendCancel(cid, "Use somente em players.") return false end
if isLimboProtection(cid, target) then return exhaustion.set(cid, config.exausted, config.cooldown) end

local eff_Pos = {x=c_Pos.x+2, y=c_Pos.y, z=c_Pos.z}
doSendMagicEffect(eff_Pos, config.effect1)
addEvent(doSendMagicEffect, 2000, eff_Pos, config.effect1)
addEvent(doSendMagicEffect, 4000, eff_Pos, config.effect1)
addEvent(doSendMagicEffect, 6000, eff_Pos, config.effect1)
addEvent(doSendMagicEffect, 7000, eff_Pos, config.effect1)
exhaustion.set(cid, config.exausted, config.cooldown)
savePos(cid, 14501)
savePos(target, 14501)
doTeleportThing(cid, config.c_Posistion)
doTeleportThing(target, config.t_Posistion)
setPlayerGroupId(cid, 2)
doCreatureExecuteTalkAction(cid, "/ghost", true)
addEvent(returnGenjutsu, config.duration* TIME_SECONDS, cid, true)
addEvent(returnGenjutsu, config.duration* TIME_SECONDS, target, false)
return true
end 
