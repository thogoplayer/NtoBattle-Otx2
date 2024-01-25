outfit_list = {
{looktype = 1785, name = "Skin Kurama", storage = 60000, points = 10},
{looktype = 1683, name = "Skin Naruto Furie", storage = 60001, points = 10},
{looktype = 1594, name = "Skin Madara Foice", storage = 60002, points = 10},
{looktype = 1426, name = "Skin Anbu", storage = 60003, points = 10}
}

function select_sto_outfit(look)
for a,b in pairs(outfit_list) do
if b.looktype == look or b.name == look then
return b
end
end
return false
end

function doPlayerAddSkin(cid, outfit)
local out = select_sto_outfit(look)
if out and getPlayerStorageValue(cid, out.storage) < 1 then
setPlayerStorageValue(cid, out.storage, 3)
return true
end
return false
end

function doPlayerRemoveSkin(cid, outfit)
local out = select_sto_outfit(look)
if out and getPlayerStorageValue(cid, out.storage) > 0 then
setPlayerStorageValue(cid, out.storage, -1)
return true
end
return false
end
