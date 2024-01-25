local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 165)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_POISON)

local arr = {
{0, 0, 0},
{0, 3, 0},
{0, 0, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end
