local config = { 
duration = 60, --- duração
subID = 1,
effect = 316, -- efeito que sai ao falar a spell
skills = {{C_NINJUTSU, 10}, {C_GLOVE, 15}}
} 


local function loopEffectGuy(cid, effect, reg_pos, summon, subID)
if isCreature(cid) and isBuffID(cid, subID) and getPlayerStorageValue(cid, 102053) == 1 then
    doSendMagicEffect(getCreaturePosition(cid), effect)
	for _, summon in ipairs(getCreatureSummons(cid)) do
         if getCreatureName(cid) == getCreatureName(summon) then
         doSendMagicEffect(getCreaturePosition(summon), effect)
         end
	end
end
end

function onCastSpell(cid, var)
if isBuffID(cid, config.subID) then doPlayerSendCancel(cid, "desculpe-me, voce ja esta transformado.") return false end
local mpos = getPlayerPosition(cid)
doCreatureAddBuff(cid, config.skills, 100, 50, config.duration, config.subID)
setPlayerStorageValue(cid, 102053,1)
delay = 0
    while (delay ~= (config.duration * TIME_SECONDS)) do
    addEvent(loopEffectGuy, delay, cid, config.effect, false, true, config.subID)
    delay = delay + 600
    end
doSendMagicEffect({x = mpos.x+1, y = mpos.y, z = mpos.z}, 400)
return true
end