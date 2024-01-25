local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)

local critical = createCombatObject()
setCombatParam(critical, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(critical, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(critical, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(critical, COMBAT_FORMULA_SKILL, 1.1, 0, 1.1, 0)


function onUseWeapon(cid, var)
local chance = 0 -- porcentagem de chance de dar critical
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local pos = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
local pos1 = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
if isCreature(getCreatureTarget(cid)) and math.random(1,100) <= chance then
doCombat(cid, critical, var)
doSendMagicEffect(getCreaturePosition(cid), 1141)
doSendMagicEffect(pos, 1076)
else
doSendMagicEffect(pos1, 1076)
doCombat(cid, combat, var)
end
end
