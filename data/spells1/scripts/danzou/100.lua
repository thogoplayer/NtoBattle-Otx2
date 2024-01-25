local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)	---ataque nivel 100
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -15, 1, -20, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 0.9
local storage = 899123

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local t_Pos = getThingPosition(getCreatureTarget(cid))
doSendMagicEffect({x=t_Pos.x+1, y=t_Pos.y, z=t_Pos.z}, 556)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
