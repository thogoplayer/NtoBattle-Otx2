function onThink(interval, lastExecution)
for _, ons in pairs(getPlayersOnline()) do
 if getPlayerStorageValue(ons, jin_StorageTime)-os.time() <= 0 and jin.getPlayerBijuu(ons) ~= 0 then
  doPlayerUnlearnInstantSpell(ons, "Bijuu Dama")
  doPlayerUnlearnInstantSpell(ons, "Bijuu Mode")
  doCreatureSetStorage(ons, jin_StorageTime, -1)
doCreatureSetStorage(ons, jin_Storage, -1)
doCreatureSetStorage(cid, 34245, 0)
  doPlayerSendTextMessage(ons, MESSAGE_STATUS_CONSOLE_RED, "O selo do Jinchuuriki foi desfeito, e você perdeu o bijuu, você pode sela-lo novamente, ou selar outro.") 
 end
end 
return true
end