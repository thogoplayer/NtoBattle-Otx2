
local items = {
{aid = 70014, item = 12325}
}



local function itemSelect(action)
for a,b in pairs(items) do
if b.aid == action then
return b.item
end
end
return 12325
end

function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 631232) < 1 then
doPlayerSendTextMessage(cid,22,"You Are Receiving An Boots!")
local itemid =  itemSelect(item.actionid)
local item = doPlayerAddItem(cid, itemid, 1)
doItemSetAttribute(item, "owner", getPlayerGUID(cid))
setPlayerStorageValue(cid, 631232, 1)
doItemSetAttribute(item, "description", ""..getItemInfo(itemid).description.."\nOwner : "..getCreatureName(cid).."")
-- doTeleportThing(cid,{x = 3467, y = 3497, z = 5})
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you already received an item!.")
-- doTeleportThing(cid,{x = 3467, y = 3497, z = 5})
end

return true
end