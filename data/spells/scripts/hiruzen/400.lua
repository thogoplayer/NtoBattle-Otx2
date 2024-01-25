local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)		---ataque nivel 400
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -14, 1, -15, 1)

local function dist_effect(cid, combat, var, adjust, eff)
if isCreature(cid) and isCreature(getCreatureTarget(cid)) then
local t_Pos = getCreaturePosition(getCreatureTarget(cid))
doSendDistanceShoot({x=t_Pos.x+adjust[1], y=t_Pos.y+adjust[2], z=t_Pos.z}, t_Pos,eff)
doCombat(cid, combat, var)
end
end


function onCastSpell(cid, var)
if isSelado(cid) then return false end
local waittime = 5.5
local storage = 663563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end


effect(getCreatureTarget(cid), {-1,0}, 667)
effect(getCreatureTarget(cid), {3,0}, 667)

dist_effect(cid, combat, var, {-2,-1}, 107)
addEvent(dist_effect , 100 , cid, combat, var, {2,-1}, 107)
addEvent(dist_effect , 200 , cid, combat, var, {-2,-1}, 107)
addEvent(dist_effect , 200 , cid, combat, var, {2,-1}, 107)
addEvent(dist_effect , 300 , cid, combat, var, {-2,-1}, 107)
addEvent(dist_effect , 300 , cid, combat, var, {2,-1}, 107)
exhaustion.set(cid, storage, waittime)
return true
end
