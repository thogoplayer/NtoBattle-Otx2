local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	local min = ((level*10)+(maglevel*1.0)+360)
	local max = ((level*10)+(maglevel*2.0)+790)
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
local waittime = 0.9
local storage = 1543231

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
