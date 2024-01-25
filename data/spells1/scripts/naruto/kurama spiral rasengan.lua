local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -80, 1, -90, 1)

function onCastSpell(cid, var) if isSelado(cid) then return false end
local waittime = 3.0
local storage = 412421
local target = getCreatureTarget(cid)

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end


local t_Pos = getCreaturePosition(getCreatureTarget(cid))
doSendMagicEffect({x=t_Pos.x-3, y=t_Pos.y-3, z=t_Pos.z}, 82)
doSendMagicEffect({x=t_Pos.x+5, y=t_Pos.y-3, z=t_Pos.z}, 82)
doSendMagicEffect({x=t_Pos.x+5, y=t_Pos.y-1, z=t_Pos.z}, 82)
doSendMagicEffect({x=t_Pos.x+5, y=t_Pos.y+1, z=t_Pos.z}, 82)
doSendMagicEffect({x=t_Pos.x+5, y=t_Pos.y-3, z=t_Pos.z}, 82)
doSendMagicEffect({x=t_Pos.x+5, y=t_Pos.y-3, z=t_Pos.z}, 82)

attackDistFullTarget(cid, combat, var, {{6, {4, -4}},{6, {-4, -4}}})
addEvent(attackDistFullTarget, 100, cid, combat, var, {{14, {4, -4}},{14, {-4, -4}}})
addEvent(attackDistFullTarget, 350, cid, combat, var, {{15, {4, -4}},{15, {-4, -4}}})
addEvent(attackDistFullTarget, 550, cid, combat, var, {{34, {4, -4}},{34, {-4, -4}}})
addEvent(attackDistFullTarget, 750, cid, combat, var, {{48, {4, -4}},{48, {-4, -4}}})
addEvent(attackDistFullTarget, 950, cid, combat, var, {{58, {4, -4}},{58, {-4, -4}}})
addEvent(attackDistFullTarget, 1150, cid, combat, var, {{69, {4, -4}},{69, {-4, -4}}})

exhaustion.set(cid, storage, waittime)
return true
end
