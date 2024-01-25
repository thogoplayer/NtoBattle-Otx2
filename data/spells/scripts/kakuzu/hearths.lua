local config = { 
storage = 42522,
cooldown = 90,  --- tempo entre um uso e outro
duration = 30, --- duração
effect = 800, -- efeito que sai ao falar a spell
skills = {{C_NINJUTSU, 35}, {C_DISTANCE, 35}}
} 


function onCastSpell(cid, var)
if exhaustion.check(cid, config.storage) then
local seetime = exhaustion.get(cid, config.storage)
doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar novamente!")
return false
end

if #getCreatureSummons(cid) < 4 then
doPlayerSendCancel(cid, "Need four heart summons")
return false
end

removeSummons(cid)
doSetCreatureOutfit(cid, {lookType = 1140}, config.duration * TIME_SECONDS)
local c_Pos = getCreaturePosition(cid)
doSendMagicEffect({x = c_Pos.x+2, y = c_Pos.y + 1, z = c_Pos.z}, 857)
exhaustion.set(cid, config.storage, config.cooldown)
doCreatureAddBuff(cid, config.skills, 1000, 0, config.duration, 3)
createLoopEffectBuff(cid, config.duration, config.effect, {0,0}, 500, true, 3)
return true
end