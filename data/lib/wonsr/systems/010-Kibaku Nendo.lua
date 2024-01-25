local config = {
["Spider"] = {
    area = {
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1},
        },
    effect = 214,
	limit = 3,
    damage = {3000,5000}
},
["Owl"] = {
    area = {
        {0, 0, 1, 0, 0},
        {0, 1, 1, 1, 0},
        {1, 1, 3, 1, 1},
        {0, 1, 1, 1, 0},
        {0, 0, 1, 0, 0},
        },
    effect = 214,
	limit = 2,
    damage = {5000,8000}
},
["Bird"] = {
    area = {
        {1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1},
        {1, 1, 3, 1, 1},
        {1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1},
        },
    effect = 214,
	limit = 1,
    damage = {8000,15000}
},
}

function summonKibakuNendo(cid, name)
local c_Pos = getPlayerPosition(cid)
if canSummonMonsterName(cid, name, config[name].limit) > 0 then -- no summons
local summon = doCreateMonster("explosive"..name, c_Pos)
if summon then
doConvinceCreature(cid, summon)
setPlayerStorageValue(summon, "owner", cid)
setPlayerStorageValue(summon, "name", name)
end
doSendMagicEffect(c_Pos, 111)
else
doPlayerSendCancel(cid, name.." limit exceeded.")
return false
end
return true
end




function blowSummon(uid)
local name = getPlayerStorageValue(uid, "name")
if config[name] then
for _, pos in pairs(getPosfromArea(uid, config[name].area)) do
    if isWalkable(pos, true) then
    doSendMagicEffect(pos, config[name].effect)
	    local creature = getTopCreature(pos).uid
	    if creature > 0 and (isMonster(creature) or (isPlayer(creature) and getPlayerStorageValue(uid, "owner") ~= creature and getPlayerLevel(creature) >= 200 and getPlayerGroupId(creature) < 3)) then
		doCreatureAddHealth(creature, -(math.random(config[name].damage[1],config[name].damage[2])))
		end
    end
end
doRemoveCreature(uid)
end
end

function blowSummons(cid)
for _, summon in pairs (getCreatureSummons(cid)) do
blowSummon(summon)
end
end