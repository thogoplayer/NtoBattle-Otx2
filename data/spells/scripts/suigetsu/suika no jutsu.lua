local config = { 
exausted = 41222,
cooldown = 45,  --- tempo entre um uso e outro
duration = 10 --- duração
} 

function onCastSpell(cid, var)
if exhaustion.check(cid, config.exausted) then
doPlayerSendCancel(cid,"Aguarde " .. exhaustion.get(cid, config.exausted) .. " segundos para usar o Suika No Jutsu  novamente.")
return false
end

doSetCreatureOutfit(cid, {lookType = 445}, config.duration * TIME_SECONDS)
exhaustion.set(cid, config.exausted, config.cooldown)
setCreatureImmuneWeaponDamageTime(cid, config.duration)
-- doPlayerSendTextMessage(cid, 27, "Você se transformou em agua e não receberá danos de armas por ".. config.duration .." segundos.")
return true
end