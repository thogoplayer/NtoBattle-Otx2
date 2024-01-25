local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN) 
setCombatParam(combat, COMBAT_PARAM_EFFECT, 5) 
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1) 
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0) 
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE) 
--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.6, -20, 1.0, 0) 

function onGetFormulaValues(cid, level, maglevel) 
    min = (level * 2 + maglevel * 3) * 7.2 - 25 
    max = (level * 2 + maglevel * 3) * 7.5 
     
    if min < 1050 then 
        min = 1050 
    end 

    return min, max 
end 

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues") 

function onCastSpell(cid, var) 
local waittime = 2.0
local storage = 34261

if isPlayer(cid) and exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar novamente.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

exhaustion.set(cid, storage, waittime)
doCombat(cid, combat, var)
return true 
end  