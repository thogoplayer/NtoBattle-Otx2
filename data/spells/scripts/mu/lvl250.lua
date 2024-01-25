local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

function onGetFormulaValues(cid, level, maglevel)
min = - (DAMAGE_FACTOR_LEVEL250 * level + DAMAGE_FACTOR_SKILL250 * maglevel)/1 * 0.75 
max = - (DAMAGE_FACTOR_LEVEL250 * level + DAMAGE_FACTOR_SKILL250 * maglevel)/1 * 1.25
return min, max  
end	

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 1000250

if exhaustion.check(cid, storage) then
    if isPlayer(cid) then
		doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
	end
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+4, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
local target = getCreatureTarget(cid)
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 1, {x = pos.x+4, y = pos.y, z = pos.z}, 1195)

exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
