local combat = createCombatObject()

local condition = createConditionObject(CONDITION_OUTFIT, false, false, 5)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
addOutfitCondition(condition, {lookType = 639})
setCombatCondition(combat, condition)

local condition = createConditionObject(CONDITION_PARALYZE, false, false, 5)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -6000)
setCombatCondition(combat, condition)

local waittime = 20.0 -- Tempo de exhaustion
local storage = 118783
function onCastSpell(cid, var)
if isSelado(cid) then return false end

if isPlayer(cid) and exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
return false
end
if isLimboProtection(cid, target) then return exhaustion.set(cid, storage, waittime) end

exhaustion.set(cid, storage, waittime)
doSendMagicEffect(getCreaturePosition(getCreatureTarget(cid)), 10)
doCombat(cid, combat, var)
return true
end