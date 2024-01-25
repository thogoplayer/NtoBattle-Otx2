local function attackedByPlayer(playerList)
for _, player in ipairs(playerList) do
doPlayerAddEloPoints(player, 1)
doPlayerSendTextMessage(player,22,"Voce ganhou 1 elo points por matar um noel event.")
end
end

function onDeath(cid, corpse, deathList)
if isMonster(cid) and getCreatureName(cid) == "Noel Event" then
attackedByPlayer(getPlayersInDeathList(deathList))
end
return true
end