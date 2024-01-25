function onSay(cid, words, param, channel)
 if jin.getPlayerBijuu(cid) ~= 0 then
  doPlayerPopupFYI(cid, "[====== Jinchuuriki System ======]\n\nVocê Jinchuuriki de ["..jin.getPlayerBijuu(cid).."]\n"..jin.getPlayerBijuuTime(cid))
 else
  doPlayerPopupFYI(cid, "[====== Jinchuuriki System ======]\n\nVocê não é Jinchuuriki.\n"..jin.getPlayerBijuuTime(cid))
 end
return true
end