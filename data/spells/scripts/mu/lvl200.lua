local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

function onGetFormulaValues(cid, level, maglevel)
min = - (DAMAGE_FACTOR_LEVEL200 * level + DAMAGE_FACTOR_SKILL200 * maglevel)/1 * 0.75 
max = - (DAMAGE_FACTOR_LEVEL200 * level + DAMAGE_FACTOR_SKILL200 * maglevel)/1 * 1.25
return min, max 
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
local storage = 1000200
local waittime = 3

if exhaustion.check(cid, storage) then
    if isPlayer(cid) then
		doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
	end
return false
end

local target = getCreatureTarget(cid)
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 1, {x = pos.x, y = pos.y, z = pos.z}, 1192)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
