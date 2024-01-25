-- == Blood Castle Event por Killua == --

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
     if item.actionid == 4726 then
          setGlobalStorageValue(bloodconfig.playersStorage, getPlayersInBlood()+1)
          print(getPlayersInBlood().. " Jogadores no Blood Castle")
     elseif item.actionid == 9371 then
          setGlobalStorageValue(bloodconfig.playersStorage, getPlayersInBlood()-1)
          print(getPlayersInBlood().. " Jogadores no Blood Castle")
     elseif item.actionid == 4727 then
		 if getPlayerLevel(cid) >= 500 and getPlayerLevel(cid) < 700 then
doPlayerAddLevel(cid, 1)
elseif getPlayerLevel(cid) < 500 then
doPlayerAddLevel(cid, 2)
end	 
doPlayerAddItem(cid,  18320, 1)
doPlayerAddItem(cid,  17090, 1)
doPlayerAddItem(cid,  2160, 50)
doPlayerSendTextMessage(cid, 50, "voce recebeu 50 Jp Ienes, 1 ticket e 1 gold token por ter participado do evento!")
     end
return true
end