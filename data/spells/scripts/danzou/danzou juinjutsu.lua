local mute = createConditionObject(CONDITION_MUTED)
local duration = 2
local exhaust = 90

function onCastSpell(cid, var)
if isSelado(cid) then return false end
if isPlayer(cid) and exhaustion.check(cid, 12120) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, 12120) .. " segundos para usar novamente.")
return false
end


local target = getCreatureTarget(cid)
if not isPlayer(target) then doPlayerSendCancel(cid, "Use somente em players.") return false end
if isLimboProtection(cid, target) then return exhaustion.set(cid, 12120, exhaust) end


setConditionParam(mute, CONDITION_PARAM_TICKS, duration * TIME_SECONDS)
if hasCondition(target, CONDITION_MUTED) then
return false
end
exhaustion.set(cid, 12120, exhaust)
doSendAnimatedText(getCreaturePosition(target), "MUTADO", 215)
doAddCondition(target, mute)
doSendMagicEffect(getCreaturePosition(target), 635)
Trap(target, duration)
return true
end