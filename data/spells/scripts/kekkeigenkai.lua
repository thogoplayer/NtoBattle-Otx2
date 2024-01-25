local config = { 
duration = 60, --- duração
effect = 442, -- efeito que sai ao falar a spell
skills = {{C_SWORD, 15}, {C_GLOVE, 15}, {C_DISTANCE, 15}, {C_SHIELD, 10}, {C_FIST, 10}}
} 


function onCastSpell(cid, var)
if isBuffID(cid, 2) then return false end

doCreatureAddBuff(cid, config.skills, 0, 0, config.duration, 2)
createLoopEffectBuff(cid, config.duration, config.effect, false, 3000, true, 2)
return true
end