local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function getCombatFormulas(cid, lv, maglv)
    local formula_min = ((lv*10 + maglv*1) + 660)
    local formula_max = ((lv*10 + maglv*2) + 1090)

    if(formula_max < formula_min) then
        local tmp = formula_max
        formula_max = formula_min
        formula_min = tmp
    end
    return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

function onCastSpell(cid, var)
    return doCombat(cid, combat, var)



end