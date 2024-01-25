local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -13.2, 1, -15, 1)

function onCastSpell(cid, var) if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

local t_Pos = getCreaturePosition(getCreatureTarget(cid))
doSendMagicEffect({x=t_Pos.x+2, y=t_Pos.y-1, z=t_Pos.z}, 213)
doSendMagicEffect({x=t_Pos.x+2, y=t_Pos.y+3, z=t_Pos.z}, 213)
doSendMagicEffect({x=t_Pos.x-2, y=t_Pos.y-1, z=t_Pos.z}, 213)
doSendMagicEffect({x=t_Pos.x-2, y=t_Pos.y+3, z=t_Pos.z}, 213)

addEvent(attackDistFullTarget, 500, cid, combat, var, {{15, {2, -1}}})
addEvent(attackDistFullTarget, 500, cid, combat, var, {{15, {-2, -1}}})
addEvent(attackDistFullTarget, 500, cid, combat, var, {{15, {2, 1}}})
addEvent(attackDistFullTarget, 500, cid, combat, var, {{15, {-2, 1}}})
exhaustion.set(cid, storage, waittime)
return true
end
