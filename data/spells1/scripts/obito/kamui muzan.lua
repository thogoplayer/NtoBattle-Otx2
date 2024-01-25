local config = { 
exausted = 12522,
cooldown = 90,  --- tempo entre um uso e outro
duration = 10, --- duração
effect1 = 196 -- efeito que sai ao falar a spell
} 

local function removeMuzan(cid)
if isPlayer(cid) then
doAppear(cid)
doSendMagicEffect(getCreaturePosition(cid), config.effect1)
end
return true
end

function onCastSpell(cid, var)
if isSelado(cid) then return false end
if getPlayerStorageValue(cid, 16700) > 1 then
doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!")
return false
end

if exhaustion.check(cid, config.exausted) then
local seetime = exhaustion.get(cid, config.exausted)
local hours, minutes, seconds = math.floor(seetime/120), math.floor(seetime/60), math.floor(seetime%60)
doPlayerSendCancel(cid, "Aguarde "..minutes.." minutos e "..seconds.." segundos para usar novamente o Kamui Muzan!")
return false
end

doSendMagicEffect(getCreaturePosition(cid), config.effect1)
setCreatureBattleLockTime(cid, config.duration)
exhaustion.set(cid, config.exausted, config.cooldown)
doCreatureSay(cid,"KAMUI!!!", 19)
doDisapear(cid)
addEvent(removeMuzan , config.duration* TIME_SECONDS, cid)
doPlayerSendTextMessage(cid, 27, "You have now ".. config.duration .." seconds of invulnerability.")
return true
end