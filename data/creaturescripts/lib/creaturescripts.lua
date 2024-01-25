function getPlayersInDeathList(deathList)
local players = {}
for _, creature in ipairs(deathList) do
    if isPlayer(creature) then
    table.insert(players, creature)
    end
end
return players
end

