function onUse(cid, item)

if #getPlayersInArea(torneio.area) > 1 then
doPlayerSendTextMessage(cid, 20 ,"Derrote todos os oponentes para ganhar!") return true end

doTeleportThing(cid, torneio.playerTemple1)
doPlayerAddItem(cid, 2160,50)
doPlayerAddItem(cid, 10137,1)
doPlayerAddItem(cid, 9004,1)
doBroadcastMessage("Parabéns ao treinador "..getCreatureName(cid).." por vencer o torneio de hoje, olhe o rank no nosso site em www.narutoskull.com")
doPlayerAddItem(cid, torneio.awardTournament, torneio.awardAmount)
return true
end