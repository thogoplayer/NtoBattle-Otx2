function onDeath(cid, corpse, deathList)
if isMonster(cid) and string.lower(getCreatureName(cid)) == string.lower("Arcanjo") then
local presentes = {18442,18441,18446,18358}
local randomChance = math.random(1, #presentes)
if isPlayer(deathList[1]) then
local artigo = getPlayerSex(deathList[1]) == 0 and "A jogadora" or "O jogador"
doBroadcastMessage("[Blood Castle] " .. artigo .. " "..getCreatureName(deathList[1]).." Deu o ataque final no Arcanjo obtendo a gloria!")
doPlayerSendTextMessage(deathList[1], 25, "Parabens voce venceu o evento Blood Castle e recebeu 1 box aleatorio, 50 Jp Ienes e 1 vale roleta para a roleta de premios e 2 gold token!")
doSendMagicEffect(getCreaturePosition(deathList[1]), 66)
if getPlayerLevel(deathList[1]) >= 500 and getPlayerLevel(deathList[1]) < 700 then
doPlayerAddLevel(deathList[1], 1)
elseif getPlayerLevel(deathList[1]) < 500 then
doPlayerAddLevel(deathList[1], 2)
end
local s  = doPlayerAddItem(deathList[1], presentes[randomChance],1)
doItemSetAttribute(s, 'description', 'Conquistada pelo '..getCreatureName(deathList[1])..' no Blood Casttle ['..os.date('%d/%m/%Y %X', os.time())..']')
doTeleportThing(deathList[1], bloodconfig.templo)
addPresencePoints(deathList[1], 15)
doPlayerAddItem(deathList[1], 2160, 50)
doPlayerAddItem(deathList[1], 17090, 1)
doPlayerAddItem(deathList[1], 18320, 2)
elseif isMonster(deathList[1]) then
local dono = getCreatureMaster(deathList[1])
local artigo = getPlayerSex(dono) == 0 and "A jogadora" or "O jogador"
doBroadcastMessage("[Blood Castle] " .. artigo .. " "..getCreatureName(dono).." Derrotou o Rei e foi o vencedor da rodada!")
doPlayerSendTextMessage(dono, 25, "Parabens voce venceu o evento Blood Castle e recebeu 1 item aleatorio, 50 Jp Ienes e 1 vale roleta para a roleta de premios!")
doSendMagicEffect(getCreaturePosition(dono), 66)
local s  = doPlayerAddItem(dono, presentes[randomChance], 1)
doItemSetAttribute(s, 'description', 'Conquistada pelo '..getCreatureName(deathList[1])..' no Blood Casttle ['..os.date('%d/%m/%Y %X', os.time())..']')
addPresencePoints(dono, 15)
if getPlayerLevel(dono) >= 500 and getPlayerLevel(dono) < 700 then
doPlayerAddLevel(dono, 1)
elseif getPlayerLevel(dono) < 500 then
doPlayerAddLevel(dono, 2)
end
doTeleportThing(dono, bloodconfig.templo)
doPlayerAddItem(dono,  2160, 50)
doPlayerAddItem(dono,  18320, 1)
doPlayerAddItem(dono,  17090, 1)
end

local tp = doCreateTeleport(1387, bloodconfig.templo, bloodconfig.estatua)
doItemSetAttribute(tp, "aid", 4727)
addEvent(removeTpa, bloodconfig.tempoSaida*1000)
setGlobalStorageValue(bloodconfig.playersStorage, 0)
putWalls()
putStones()
end
return true
end