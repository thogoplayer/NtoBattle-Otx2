local percent = 10 -- Em % da Chakra do alvo que será removida
local percen2 = 0 -- Em % da Chakra do alvo que será add

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)

if not isPlayer(target) then doPlayerSendCancel(cid, "Use apenas em players.") return false end

local damage = getCreatureMana(target) / 100 * percent
local damag2 = getCreatureMana(target) / 100 * percen2
addEvent(doCreatureAddMana, 0, target, - damage)
addEvent(doSendAnimatedText, 0, getCreaturePosition(target), "Juken", math.random(01,255))
doCreatureAddMana(cid, damag2)
return true
end