local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)		---ataque nivel 300
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -18.3, 1, -20, 1)

function onCastSpell(cid, var)
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372


if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end


local t_Pos = getThingPosition(getCreatureTarget(cid))
doSendMagicEffect({x=t_Pos.x, y=t_Pos.y+1, z=t_Pos.z}, 159)
doSendMagicEffect({x=t_Pos.x+2, y=t_Pos.y+1, z=t_Pos.z}, 159)

attackDistFullTarget(cid, combat, var, {{26, {-3, 0}}})
addEvent(attackDistFullTarget, 200, cid, combat, var, {{26, {3, 0}}})
addEvent(attackDistFullTarget, 400, cid, combat, var, {{26, {3, 0}}})
exhaustion.set(cid, storage, waittime)
return true
end
