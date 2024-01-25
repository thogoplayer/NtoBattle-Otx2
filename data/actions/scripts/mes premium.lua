function onUse(cid, item, frompos, item2, topos)
local config={
dias="30"
}
doPlayerAddPremiumDays(cid, config.dias)
doPlayerSendTextMessage(cid,22,"Parabéns! Você Ganhou 30 Dias de Premium Account! :)")
doRemoveItem(item.uid,1) 
return true
end