local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, 202)

function onGetFormulaValues(cid, level, maglevel)
min = - (DAMAGE_FACTOR_LEVEL600 * level + DAMAGE_FACTOR_SKILL600 * maglevel)/1 * 0.75 
max = - (DAMAGE_FACTOR_LEVEL600 * level + DAMAGE_FACTOR_SKILL600 * maglevel)/1 * 1.25
return min, max 
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 1000600

if exhaustion.check(cid, storage) then
    if isPlayer(cid) then
		doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
	end
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 790)
doSendMagicEffect(position1, 790)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
