function onDeath(cid)
 if getPlayerStorageValue(cid, jin_StorageTime)-os.time() <= 0 and jin.getPlayerBijuu(cid) ~= 0 then
  doPlayerRemoveJinchuuriki(cid)
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "O selo do Jinchuuriki foi desfeito, e você perdeu o bijuu, você pode sela-lo novamente, ou selar outro.") 
doCreatureSetStorage(cid, 34245, 0)
 end

return true
end

function onLogin(cid)
registerCreatureEvent(cid, "JinSystemLook")
registerCreatureEvent(cid, "JinSystemLogout")
registerCreatureEvent(cid, "JinSystemDeath")

 if getPlayerStorageValue(cid, jin_StorageTime)-os.time() <= 0 and jin.getPlayerBijuu(cid) ~= 0 then
  doPlayerRemoveJinchuuriki(cid)
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "O selo do Jinchuuriki foi desfeito, e você perdeu o bijuu, você pode sela-lo novamente, ou selar outro.") 
doCreatureSetStorage(cid, 34245, 0)
 end
return true
end


function onLogout(cid)
 if getPlayerStorageValue(cid, jin_StorageTime)-os.time() <= 0 and jin.getPlayerBijuu(cid) ~= 0 then
 doPlayerRemoveJinchuuriki(cid)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "O selo do Jinchuuriki foi desfeito, e você perdeu o bijuu, você pode sela-lo novamente, ou selar outro.") 
doCreatureSetStorage(cid, 34245, 0)
 end
return true
end