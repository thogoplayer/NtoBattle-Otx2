local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -7.7, 1, -8.5, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.5
local storage = 663563
local storag2 = 10215

if isPlayer(cid) and getPlayerStorageValue(cid, storag2) < 1 then
doPlayerSendCancel(cid, "Voce precisa estar no Modo Bijuu para usar esta spell.")
return false
end

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

creatureMagicEffect(getCreatureTarget(cid), { {54, {0, -1}}, {54, {1, -1}} })

attackdist(cid, combat, var, {{4, {-2, 0}}, {4, {3, 0}}})
addEvent(attackdist, 100, cid, combat, var, {{4, {-2, -2}}, {4, {3, -2}}})
addEvent(attackdist, 200, cid, combat, var, {{4, {-2, -4}}, {30, {3, -4}}})
addEvent(attackdist, 300, cid, combat, var, {{30, {-3, -2}}, {4, {4, -3}}})
addEvent(attackdist, 400, cid, combat, var, {{4, {-2, -4}}, {30, {4, -4}}})
addEvent(attackdist, 500, cid, combat, var, {{4, {-4, -2}}, {4, {5, -2}}})
addEvent(attackdist, 600, cid, combat, var, {{23, {-4, -3}}, {4, {6, -3}}})
exhaustion.set(cid, storage, waittime)
return true
end
