local config = { 
storage = 42522,
cooldown = 120,  --- tempo entre um uso e outro
duration = 60, --- duração
effect = 513, -- efeito que sai ao falar a spell
skills = {{C_NINJUTSU, 15}, {C_SHIELD, 20}}
} 


function onCastSpell(cid, var)
if exhaustion.check(cid, config.storage) then
local seetime = exhaustion.get(cid, config.storage)
doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar novamente!")
return false
end

exhaustion.set(cid, config.storage, config.cooldown)
doCreatureAddBuff(cid, config.skills, 0, 0, config.duration, 3)
createLoopEffectBuff(cid, config.duration, config.effect, {2,0}, 500, true, 3)
return true
end