local config = { 
storage = 42522,
cooldown = 90,  --- tempo entre um uso e outro
duration = 30, --- duração
effect = 183, -- efeito que sai ao falar a spell
skills = {{C_NINJUTSU, 25}, {C_GLOVE, 25}}
} 


function onCastSpell(cid, var)
if exhaustion.check(cid, config.storage) then
local seetime = exhaustion.get(cid, config.storage)
doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar novamente!")
return false
end

exhaustion.set(cid, config.storage, config.cooldown)
doCreatureAddBuff(cid, config.skills, 1000, 0, config.duration, 3)
createLoopEffectBuff(cid, config.duration, config.effect, false, 300, true, 3)
return true
end