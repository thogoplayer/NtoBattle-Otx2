local config = { 
storage = 42522,
cooldown = 90,  --- tempo entre um uso e outro
duration = 30, --- duração
effect = 50, -- efeito que sai ao falar a spell
skills = {{C_NINJUTSU, 7}, {C_GLOVE, 8}, {C_SHIELD, 8}}
} 


function onCastSpell(cid, var)
if exhaustion.check(cid, config.storage) then
local seetime = exhaustion.get(cid, config.storage)
doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar novamente!")
return false
end

exhaustion.set(cid, config.storage, config.cooldown)
doCreatureAddBuff(cid, config.skills, 1000, 0, config.duration, 3)
createLoopEffectBuff(cid, config.duration, config.effect, {1,0}, 500, true, 3)
return true
end