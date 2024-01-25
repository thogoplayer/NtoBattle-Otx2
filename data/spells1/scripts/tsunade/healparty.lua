local combat = createCombatObject()
local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 845)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 40)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)

setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1)
 
local baseMana = 120
function onCastSpell(cid, var)
local waittime = 1.0
local storage = 674352

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

local heal = getPlayerLevel(cid)*10+getPlayerMagLevel(cid)*25
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, heal)
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
 
local membersList = getPartyMembers(cid)
if(membersList == nil or type(membersList) ~= 'table' or table.maxn(membersList) <= 1) then
doPlayerSendDefaultCancel(cid, RETURNVALUE_NOPARTYMEMBERSINRANGE)
doSendMagicEffect(pos, CONST_ME_POFF)
return LUA_ERROR
end
 
local affectedList = {}
for _, pid in ipairs(membersList) do
if(getDistanceBetween(getCreaturePosition(pid), pos) <= 36) then
table.insert(affectedList, pid)
end
end
 
local tmp = table.maxn(affectedList)
if(tmp <= 1) then
doPlayerSendDefaultCancel(cid, RETURNVALUE_NOPARTYMEMBERSINRANGE)
doSendMagicEffect(pos, CONST_ME_POFF)
return LUA_ERROR
end
 
local mana = math.ceil((0.9 ^ (tmp - 1) * baseMana) * tmp)
if(getCreatureMana(cid) < mana) then
doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHMANA)
doSendMagicEffect(pos, CONST_ME_POFF)
return LUA_ERROR
end
 
if(doCombat(cid, combat, var) ~= LUA_NO_ERROR) then
doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
doSendMagicEffect(pos, CONST_ME_POFF)
return LUA_ERROR
end
 
doCreatureAddMana(cid, -(mana - baseMana), false)
doPlayerAddSpentMana(cid, (mana - baseMana))
for _, pid in ipairs(affectedList) do
doAddCondition(pid, condition)
end
 
return LUA_NO_ERROR
end