local removeChakraTarget = 80 -- Em % da Chakra do alvo que será removida
local addChakraCid = 0 -- Em % da Chakra do alvo que será add
local waittime = 90
local storage = 512312

function onCastSpell(cid, var)

if exhaustion.check(cid, storage) then
return false
end
local target = getCreatureTarget(cid)
if not isPlayer(target) then doPlayerSendCancel(cid, "Use apenas em players.") return false end
if isLimboProtection(cid, target) then return exhaustion.set(cid, storage, waittime) end

local tPos = getCreaturePosition(target)
doSendMagicEffect({x=tPos.x+1, y=tPos.y, z=tPos.z}, 307)
exhaustion.set(cid, storage, waittime)
doCreatureAddMana(target, - getCreatureMana(target) / 100 * removeChakraTarget)
doSendAnimatedText(tPos, "SHIKI FUUJIN", math.random(01,255))
doCreatureAddMana(cid, getCreatureMana(target) / 100 * addChakraCid)
return true
end