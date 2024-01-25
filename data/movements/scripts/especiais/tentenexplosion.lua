local config = {
    area = {
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1},
        },
    effect = 214,
    damage = {10000,50000}
}

local positions = {
[1] = {1, 1},
[2] = {1, 0},
[3] = {1, -1},
[4] = {0, 1},
[5] = {-1, -1},
[6] = {-1, 0},
[7] = {-1, 1},
[8] = {0, -1},
[9] = {0, 0}
}

local function ajustPos(pos)
local POS = {}
for i=1, 9 do
POS[i] = {x=pos.x+positions[i][1], y=pos.y+positions[i][2], z=pos.z}
end
return POS
end



function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if isPlayer(cid) and getItemAttribute(item.uid, "owner") ~= getPlayerGUID(cid) then
for _, pos in pairs(ajustPos(toPosition)) do
    if isWalkable(pos, true) then
    doSendMagicEffect(pos, config.effect)
	    local creature = getTopCreature(pos).uid
	    if creature > 0 and (isMonster(creature) or (isPlayer(creature) and getItemAttribute(item.uid, "owner") ~= getPlayerGUID(creature) and getPlayerLevel(creature) >= 200 and getPlayerGroupId(creature) < 3)) then
		doCreatureAddHealth(creature, -(math.random(config.damage[1],config.damage[2])))
		end
    end
end
doRemoveItem(item.uid)
end
return true
end