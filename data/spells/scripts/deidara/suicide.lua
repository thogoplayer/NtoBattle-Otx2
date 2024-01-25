local percent = 95 -- Em % da HP do alvo que será removida
local effect = 30 -- Efeito ao se suicidar
function onCastSpell(cid, var)
    local target = getCreatureTarget(cid)
    local damage = getCreatureHealth(target) / 100 * percent
    
    if isMonster(cid)﻿ then 
        creatureGoToPos(cid, getCreaturePosition(getCreatureTarget(cid)), 300)
        doSendAnimatedText(getCreaturePosition(cid), "SUICIDE", 35) 
        addEvent(doCreatureAddHea﻿lth, 1500, target, - damage) 
        addEvent(doKillCreature, 1600, cid)
        addEvent(doSendMagicEffect, 1400, getCreaturePosition(cid), effect)
        return true
    end
    return true
end