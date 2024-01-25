function onSay(cid, words, param, channel)
if getPlayerStorageValue(cid, 40000) == 16 then
doPlayerPopupFYI(cid, "Você ja concluiu todas as sagas.")
return true
end
doPlayerAtualSaga(cid)
return true
end