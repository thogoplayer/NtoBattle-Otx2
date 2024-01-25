--[[
	Spell by Shawak
	Wolf transform
]]--
 
local time = 120 * 1000 -- 120 * 1000 = 2 min
local addShielding = 20 -- how much shielding should be added
 
 
local wolf = {lookType = 247, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 5)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
 
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, time)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, addShielding)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setCombatCondition(combat, condition)
 
local speed = createConditionObject(CONDITION_HASTE)
setConditionParam(speed, CONDITION_PARAM_TICKS, time)
setConditionFormula(speed, 0.7, -56, 0.7, -56)
setCombatCondition(combat, speed)
 
local outfit = createConditionObject(CONDITION_OUTFIT)
setConditionParam(outfit, CONDITION_PARAM_TICKS, time)
addOutfitCondition(outfit, wolf)
setCombatCondition(combat, outfit)
 
local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_SUBID, 2)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, time)
setCombatCondition(combat, exhaust)
 
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
