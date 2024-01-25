function removeItems(positions, item)
 for _, pos in pairs(positions) do
    local grade = getTileItemById(pos, item)
          if grade then
               doRemoveItem(grade.uid)
          end
	end
end

local storage = 66259
local pos = {{x = 2868, y = 2003, z = 7}, {x = 2869, y = 2003, z = 7}, {x = 2870, y = 2003, z = 7}, {x = 2901, y = 2003, z = 7}, {x = 2902, y = 2003, z = 7}, {x = 2903, y = 2003, z = 7}}
local itemid = 1544

function onUse(cid, item, frompos, item2, topos)
    if getGlobalStorageValue(storage) > os.time() then return false end
	local c_pos = getCreaturePosition(cid)
	if c_pos.x == 2885 and c_pos.y ==1986 and c_pos.z == 4 then
    setGlobalStorageValue(storage, 120*60 + os.time())
    removeItems(pos, itemid)
	doBroadcastMessage("The castle's security was reinforced by the current {King}, the monsters were released ... Get ready!", 21)
	end
end
