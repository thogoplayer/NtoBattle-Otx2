function onUse(cid, item)


if getPlayerStorageValue(cid, 7015) < 1 then
doPlayerAddPremiumDays(cid, 3)
setPlayerStorageValue(cid, 7015, 1)
doPlayerSendTextMessage(cid,22,"You received 3 premium days!")
end
end