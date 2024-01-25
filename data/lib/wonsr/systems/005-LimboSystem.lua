function isLimbo(uid)
	return getCreatureStorage(uid, "limbo") == 1
end

local limit_Limbo = 2
function allowLimbo(cid)
for _, summon in pairs(getCreatureSummons(cid)) do
if isLimbo(summon) then
limit_Limbo = limit_Limbo -1
end
end

return limit_Limbo
end

function removeLimbo(player, limbo)
doTeleportThing(player, getCreaturePosition(limbo))
addEvent(doRemoveCreature, 100, limbo)
end


function isLimboProtection(cid, target)
if not isPlayer(target) or not isMadara(target) then return false end
local limboProtection = false
for _, summon in pairs(getCreatureSummons(target)) do
    if isLimbo(summon) then
    removeLimbo(target, summon)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, string.format("O jogador %s usou um LIMBO para escapar do seu jutsu.", getCreatureName(target)))
    limboProtection = true
    break
    end
end
return limboProtection
end

function createLimbo(cid, quant)
if quant > 0 then
    local anyPos, pos = {x= 2184, y=3577, z= 7}, getCreaturePosition(cid)
	local toPos = {
        {x = pos.x + 1, y = pos.y, z = pos.z},
        {x = pos.x - 1, y = pos.y, z = pos.z},
    }
        for i = 1, quant do
            local s = doCreateMonster("limbo", anyPos)
			if s then
			setCreatureName(s, "[LIMBO] "..getCreatureName(cid).."", "a [LIMBO] " .. getCreatureName(cid))
			doCreatureSetStorage(s, "limbo", 1)
			doConvinceCreature(cid, s)

            local toPos = isWalkable(toPos[i]) and toPos[i] or pos
            addEvent(doTeleportThing, 100, s, toPos)
            doSendMagicEffect(toPos, CONST_ME_POFF)
			end
        end
end
end