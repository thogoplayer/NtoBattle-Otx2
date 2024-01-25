local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_SHOTONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10, 1, -15, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 0.9
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getThingPosition(getCreatureTarget(cid))
doSendMagicEffect({x=pos.x+1, y=pos.y+1, z=pos.z}, 266)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
