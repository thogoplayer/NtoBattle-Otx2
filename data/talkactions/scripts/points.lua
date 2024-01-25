function onSay(cid, words, param, channel)
doPlayerPopupFYI(cid, "Voce possui ".. getPlayerStorageValue(cid, 3000) .." Online Points.")
return true
end