local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, 204)

function onGetFormulaValues(cid, level, maglevel)
min = - (DAMAGE_FACTOR_LEVEL400 * level + DAMAGE_FACTOR_SKILL400 * maglevel)/1 * 0.75 
max = - (DAMAGE_FACTOR_LEVEL400 * level + DAMAGE_FACTOR_SKILL400 * maglevel)/1 * 1.25
return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
local storage = 1000400
local waittime = 1

if exhaustion.check(cid, storage) then 
    if isPlayer(cid) then
		doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
	end
return false
end


local position2 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position2, 1196)

local target = var.number

		if (isCreature(cid) and isCreature(target)) then
			doCombat(cid, combat, var)
			local tpos = getCreaturePosition(target)
			local epos = {x=tpos.x+1, y=tpos.y+1, z=tpos.z}
			doSendMagicEffect(epos, 1196)
		end

exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
