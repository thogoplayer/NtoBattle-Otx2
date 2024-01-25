local function attackedByPlayer(playerList, monster)
for _, player in ipairs(playerList) do
SAGASYSTEM.onDeath(player, monster)
end
end

function onDeath(cid, corpse, deathList)
attackedByPlayer(getPlayersInDeathList(deathList), getCreatureName(cid))
return true
end