function onKill(cid, target)

local award = {
[0] = {1000000, 100},
[1] = {2000000, 200},
[2] = {3000000, 300},
[3] = {4000000, 400},
[4] = {5000000, 500},
[5] = {6000000, 600},
[6] = {7000000, 700},
[7] = {8000000, 800},
[8] = {9000000, 900},
[9] = {10000000, 1000}
} 

local recom = award[getPlayerStorageValue(target, 13131)]


if getTileInfo(getCreaturePosition(cid)).pvp or getTileInfo(getCreaturePosition(target)).pvp then return true end
if getPlayerStorageValue(target, 13131) > -1 then
doPlayerAddMoney(cid, recom[1])
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você ganhou " .. recom[2] .. " golds por matar um jogador que estava sendo procurado.")
setPlayerStorageValue(target, 13131, -1)
end
return true
end