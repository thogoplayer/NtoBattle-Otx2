function onSay(cid, words, param, channel)
if(words == "/bloqanuncio") then  
if getGlobalStorageValue(5421) <= 0 then
setGlobalStorageValue(5421, 1)
doBroadcastMessage("O Anuncio foi Bloqueado pelo "..getCreatureName(cid).."!")
else
doPlayerSendCancel(cid,"O anuncio ja esta bloqueado")
end
elseif (words == "/desbloqanuncio") then 
if getGlobalStorageValue(5421) >= 1 then
setGlobalStorageValue(5421, 0)
doBroadcastMessage("O Anuncio foi Desloqueado pelo "..getCreatureName(cid).."!")
else
doPlayerSendCancel(cid,"O anuncio ja esta desbloqueado")
end
end
return true
end
