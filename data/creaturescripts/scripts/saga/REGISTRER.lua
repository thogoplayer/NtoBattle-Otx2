function onLogin(cid)
 registerCreatureEvent(cid, "DesbugarSagaDeath")
 registerCreatureEvent(cid, "DesbugarSagaLogout")

 if getPlayerSaga(cid, 13) then
 registerCreatureEvent(cid, "SagaItachiGen")
 end 
 
 if getPlayerSaga(cid, 12) then
 registerCreatureEvent(cid, "SagaTwelveNinjas")
 end
 
 
 if getPlayerStorageValue(cid, 40000) < 1 then
 setPlayerStorageValue(cid,40000, 0)
 setPlayerStorageValue(cid,40100, 1)
 end
 if getPlayerStorageValue(cid, 40234) < 1 then
 setPlayerStorageValue(cid,40234, 0)
 end
 
 if (getPlayerStorageValue(cid, 192132) < 1) and (getPlayerStorageValue(cid, 192133) < 1) then
 setPlayerStorageValue(cid,192132, 0)
 setPlayerStorageValue(cid,192133, 0)
 end

 
 
 return true
end
