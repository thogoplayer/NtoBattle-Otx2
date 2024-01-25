local positions = {
[1] = {1, 1},
[2] = {1, 0},
[3] = {1, -1},
[4] = {0, 1},
[5] = {-1, -1},
[6] = {-1, 0},
[7] = {-1, 1},
[8] = {1, 0},
[9] = {0, -1}
}
local function ajustPos(pos)
local POS = {}
for i=1, 9 do
POS[i] = {x=pos.x+positions[i][1], y=pos.y+positions[i][2], z=pos.z}
end
return POS
end

local function removeItem(positions, item_id)
for i = 1, #positions do
    local item = getTileItemById(positions[i], item_id).uid
     if item > 0 then
     doRemoveItem(item)
     end
end
end


local function addTrap(positions, itemid, time)
local valid_Pos = {}
for i=1, #positions do
	if isWalkable(positions[i], true) then
		doCreateItem(itemid, 1, positions[i])
		doSendMagicEffect(positions[i], 140)
		table.insert(valid_Pos, positions[i])
	end
end 
addEvent(removeItem, time, valid_Pos, itemid)
end



local waittime = 20.0
local storage = 540986
function onCastSpell(cid, var)
if exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar novamente.")
return false
end
isLimboProtection(cid, getCreatureTarget(cid))
local pos = getCreaturePosition(getCreatureTarget(cid))
exhaustion.set(cid, storage, waittime)
addTrap(ajustPos(pos), 14466, 5000)
return true
end



