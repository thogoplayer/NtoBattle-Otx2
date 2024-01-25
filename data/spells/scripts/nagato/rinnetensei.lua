local config = {
storage = 82222,
cd = 180, --  3 minutos
duration = 10,
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
		
function onSelectRinneTensei(cid, target)
effect(target, {0,0}, 10)
doPlayerSendTextMessage(target, MESSAGE_STATUS_CONSOLE_BLUE, "You received protection from rinne tensei, from the player "..getCreatureName(cid).." for "..config.duration.." seconds")
exhaustion.set(target, config.storage+1, config.duration)
registerCreatureEvent(target, "RinneTensei")
end
setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onSelectRinneTensei")

function onCastSpell(cid, var)
if isSelado(cid) then return false end
if isPlayer(cid) and exhaustion.check(cid, config.storage) then
return false
end

   doCombat(cid, combat, var)
   exhaustion.set(cid, config.storage, config.cd)
   return true
end

