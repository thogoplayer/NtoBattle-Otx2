function onUse(cid, item, position, fromPosition)
if getPlayerStorageValue(cid, 19231) < 1 then
doPlayerLearnInstantSpell(cid, "Kekkei Genkai Shiki Fuujin")
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce aprendeu um ninshu de selamento especial para bijuu.")
setPlayerStorageValue(cid, 19231, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja aprendeu o jutsu!.")
end
return true  
end