function onDeath(cid, corpse, deathList)
if isMonster(cid) and string.lower(getCreatureName(cid)) == string.lower("Guarda Do Portao") then
if isPlayer(deathList[1]) then
local artigo = getPlayerSex(deathList[1]) == 0 and "A jogadora" or "O jogador"
doPlayerAddItem(deathList[1], 17090, 1)
doBroadcastMessage("[Blood Castle] " .. artigo .. " "..getCreatureName(deathList[1]).." derrotou o Guarda do Portao! Prossigam para a sala do arcanjo!")
end
if isMonster(deathList[1]) then
local dono = getCreatureMaster(deathList[1])
local artigo = getPlayerSex(dono) == 0 and "A jogadora" or "O jogador"
doPlayerAddItem(dono,  17090, 1)
doBroadcastMessage("[Blood Castle] " .. artigo .. " "..getCreatureName(dono).." derrotou o Guarda do Portao! Prossigam para a sala do arcanjo!")
end
removeWalls()
addEvent(createAngel, 5*1000)
end
return true
end