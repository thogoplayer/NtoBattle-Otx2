function onCastSpell(cid, var)
local time = 5
local exhaust = 120
local target = getCreatureTarget(cid)
local condition = createConditionObject(CONDITION_MUTED)
setConditionParam(condition, CONDITION_PARAM_TICKS, time*1000)
local targetpos = getCreaturePosition(target)


if isPlayer(cid) and exhaustion.check(cid, 12120) == true then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, 12120) .. " segundos para usar novamente.")
return false
end



if isPlayer(cid) and (not(isPlayer(target))) then
doPlayerSendCancel(cid, "Use somente em Players.")
return false
end



if hasCondition(target, CONDITION_MUTED) == true then
return false
end
-- exhaustion.set(cid, 12120, exhaust)
if isPlayer(target) and FindLimbo(target) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "O jogador " .. getCreatureName(target).. " usou um LIMBO para escapar do seu jutsu.")
return false
end
doSendAnimatedText(getCreaturePosition(target), "MUTADO", 215)
doAddCondition(target, condition)
doSendMagicEffect(targetpos, 635)
Trap(target, time)
return true
end