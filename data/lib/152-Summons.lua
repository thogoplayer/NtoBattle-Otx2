function isPlayerSummon(cid, monster)
return getCreatureMaster(monster) == cid
end

function isSummon(sid)
return isCreature(sid) and getCreatureMaster(sid) ~= sid and isPlayer(getCreatureMaster(sid))   --alterado v2.9
end

function removeSummons(cid)
for _, summon in pairs(getCreatureSummons(cid)) do
doRemoveCreature(summon)
end
end


function canSummonMonsterName(cid, name, limite)
local canSummon = limite
for _, summon in pairs(getCreatureSummons(cid)) do
    if getCreatureName(summon) == name then
    canSummon = canSummon - 1
    end
end
return canSummon
end

function invi(cid)
	doCreatureExecuteTalkAction(cid, "!/ghost!qzUcOdE", true)
	summons = getCreatureSummons(cid)
	for _, summon in pairs(summons) do
	doRemoveCreature(summon)
	end
end

function removeGhost(player)
    local newPlayer = getPlayerByGUID(player)
    if isCreature(newPlayer) then
        if isPlayerGhost(newPlayer) then
            doCreatureExecuteTalkAction(newPlayer, "!/ghost!qzUcOdE", true)
        end
        if isPlayerGhost(newPlayer) then
            addEvent(removeGhost, 1000, player)
        end
    else
        addEvent(removeGhost, 1000, player)
    end
end