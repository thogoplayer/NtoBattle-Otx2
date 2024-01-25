
local items = {
{aid = 70017, item = 10369}
}



local function itemSelect(action)
for a,b in pairs(items) do
if b.aid == action then
return b.item
end
end
return 10369
end

function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 631232) < 1 then
doPlayerSendTextMessage(cid,22,"You Are Receiving An Shuriken!")
local item = doPlayerAddItem(cid, itemSelect(item.actionid), 1)
doItemSetAttribute(item, "owner", getPlayerGUID(cid))
doItemSetAttribute(item, "description", "Owner : "..getCreatureName(cid).."")
setPlayerStorageValue(cid, 631232, 1)
-- doTeleportThing(cid,{x = 3467, y = 3497, z = 5})
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you already received an item!.")
-- doTeleportThing(cid,{x = 3467, y = 3497, z = 5})
end

return true
end