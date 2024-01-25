function onUse(cid, item)
local torneios = 1
if #getCreatureSummons(cid) >= 1 then
doPlayerSendCancel(cid, "remove o kuchyose caso esteja!")
else
if #getPlayersInArea(torneio.area) > 1 then
doPlayerSendTextMessage(cid, 20 ,"Só o ultimo que ficar na arena, poderá abrir está porta! ") return true end
doTeleportThing(cid, torneio.playerTemple)
doBroadcastMessage("[Torneio] Parabéns ao treinador "..getCreatureName(cid).." foi o ganhador do torneio de hoje, verifique o rank em nosso site www.narutoinsanity.ddns.net!")
doPlayerAddItem(cid,2160,100)
doPlayerAddItem(cid,10137,2)
doPlayerAddItem(cid,7477,150)
doPlayerAddItem(cid,2144,150)
addTopt(cid, torneios)
doPlayerSendTextMessage(cid,MESSAGE_EVENT_ORANGE,"[Torneio] Você já venceu "..(getTopt(cid,torneio)).."x, Parabéns.")
doPlayerAddItem(cid, torneio.awardTournament, torneio.awardAmount)
return true
end
end