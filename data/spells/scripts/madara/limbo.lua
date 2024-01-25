local config = { 
exausted = 12522,
cooldown = 300,  --- tempo entre um uso e outro
} 

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
if exhaustion.check(cid, config.exausted) then
local seetime = exhaustion.get(cid, config.exausted)
doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar novamente o Kamui Muzan!")
return false
end
exhaustion.set(cid, config.exausted, config.cooldown)
createLimbo(cid, allowLimbo(cid))
return true
end
           
