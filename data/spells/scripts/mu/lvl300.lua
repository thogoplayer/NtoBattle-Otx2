local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

function onGetFormulaValues1(cid, level, maglevel)
min = - (DAMAGE_FACTOR_LEVEL300 * level + DAMAGE_FACTOR_SKILL300 * maglevel)/2 * 0.75 
max = - (DAMAGE_FACTOR_LEVEL300 * level + DAMAGE_FACTOR_SKILL300 * maglevel)/2 * 1.25
return min, max 
end

setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")

function onCastSpell(cid, var)
local storage = 1000300
local waittime = 1

if exhaustion.check(cid, storage) then
    if isPlayer(cid) then
		doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
	end
return false
end

local target = var.number

for i=1, 1 do
	addEvent(function()
		if (isCreature(cid) and isCreature(target)) then
			doCombat(cid, combat1, var)
			local tpos = getCreaturePosition(target)
			local epos = {x=tpos.x+1, y=tpos.y, z=tpos.z}
			doSendMagicEffect(epos, 1193)
		end
	end, i * 75)
end

exhaustion.set(cid, storage, waittime)
return TRUE
end
