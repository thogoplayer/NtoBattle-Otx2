local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)	---ataque nivel 170
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.5
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

local t_Pos = getThingPosition(getCreatureTarget(cid))
doSendMagicEffect({x=t_Pos.x, y=t_Pos.y+1, z=t_Pos.z}, 727)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
