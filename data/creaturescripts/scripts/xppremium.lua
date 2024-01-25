function onLogin(cid)
registerCreatureEvent(cid, "XPPremium")
local voc = config[getPlayerVocation(cid)]
local outfit = {lookType = voc[2]}
if(not(isPremium(cid) == true)) and (not(getPlayerStorageValue(cid, 89745) == 5)) then
doPlayerSetExperienceRate(cid, 1.0) 
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Adquira premium account e tenha 30% de exp a mais!")	
elseif(not(isPremium(cid) == true)) and (getPlayerStorageValue(cid, 89745) == 5) then
doPlayerSetExperienceRate(cid, 1.1) 
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Adquira premium account e tenha 30% de exp a mais!")	
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce tem 10% de exp a mais por ser um membro da akatsuki, divirtasse!")	
doCreatureChangeOutfit(cid, outfit)
elseif(isPremium(cid) == true) and (not(getPlayerStorageValue(cid, 89745) == 5)) then
doPlayerSetExperienceRate(cid, 1.3) 
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce e premium account e possui 30% de exp a mais!")	
elseif(isPremium(cid) == true) and (getPlayerStorageValue(cid, 89745) == 5) then
doPlayerSetExperienceRate(cid, 1.4) 
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce e premium account e possui 30% de exp a mais!")	
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce tem 10% de exp a mais por ser um membro da akatsuki, divirtasse!")
doCreatureChangeOutfit(cid, outfit)	
end
return true
end