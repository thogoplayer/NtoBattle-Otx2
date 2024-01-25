local config = {
hours = 24,
storage = 58486,
rewards = {
    {itemid = 2160, count = 50},
    {itemid = 2688, count = 200},
	{itemid = 2326, count = 1},
}
}

local msg = {}
for _, reward in pairs (config.rewards) do
table.insert(msg, reward.count.."x "..getItemNameById(reward.itemid))
end


function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid,config.storage) <= os.time() then
    if getPlayerLevel(cid) >= 350 then
	for _, reward in pairs (config.rewards) do
	doPlayerAddItem(cid, reward.itemid, reward.count)
	end
	doPlayerSendTextMessage(cid,22, string.format("You received %s",table.concat(msg, ",")))
	setPlayerStorageValue(cid, config.storage, os.time()+config.hours*3600)
	doSendMagicEffect(getCreaturePosition(cid), 745,cid)
	doPlayerSave(cid)
    else
    doPlayerSendTextMessage(cid,22,"You need level 350 to get prize.")
    end
else
doPlayerSendTextMessage(cid,22, "Desculpe, mas voce deve aguardar ate "..os.date("%d %B %Y %X ", getPlayerStorageValue(cid,config.storage)).." para pegar novamente!")
end
 
return false
end