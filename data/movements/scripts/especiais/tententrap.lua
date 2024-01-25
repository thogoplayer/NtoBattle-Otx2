local config ={
itemid = 14466,
duration = 3,
effect = 140

}

local positions = {
[1] = {1, 1},
[2] = {1, 0},
[3] = {1, -1},
[4] = {0, 1},
[5] = {-1, -1},
[6] = {-1, 0},
[7] = {-1, 1},
[8] = {0, -1}
}

local function ajustPos(pos)
local POS = {}
for i=1, 8 do
POS[i] = {x=pos.x+positions[i][1], y=pos.y+positions[i][2], z=pos.z}
end
return POS
end

local function addTrap(positions, itemid, time)
local valid_Pos = {}
for i=1, #positions do
	if isWalkable(positions[i], true) then
		doCreateItem(itemid, 1, positions[i])
		doSendMagicEffect(positions[i], config.effect)
		table.insert(valid_Pos, positions[i])
	end
end 
addEvent(removeItemPositions, time, itemid, valid_Pos)
end


function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if isPlayer(cid) and getItemAttribute(item.uid, "owner") ~= getPlayerGUID(cid) then
doRemoveItem(item.uid)
addTrap(ajustPos(toPosition), config.itemid, config.duration * TIME_SECONDS)
end
return true
end