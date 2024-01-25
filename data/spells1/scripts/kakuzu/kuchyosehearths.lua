local hearts = {
{"heart1", {-1,1}},
{"heart2", {1,1}},
{"heart3", {-1,-1}},
{"heart4", {1,-1}}
}

local exausted = 41222
local cooldown = 60


local function addHearts(cid)
if isCreature(cid) then
local c_Pos = getCreaturePosition(cid)
    for _, summon in pairs(hearts) do
    local monsterPos = {x = c_Pos.x+summon[2][1], y = c_Pos.y + summon[2][2], z = c_Pos.z}
	local createPos = (isWalkable(monsterPos) and monsterPos or c_Pos)
    local heart = doCreateMonster(summon[1], createPos)
		if isCreature(heart) then
        doConvinceCreature(cid, heart)
		end
   end
end
end

function onCastSpell(cid, var)

if exhaustion.check(cid, exausted) then
doPlayerSendCancel(cid,"Aguarde " .. exhaustion.get(cid, exausted) .. " segundos summonar novamente.")
return false
end
	
    if #getCreatureSummons(cid) > 0 then
    removeSummons(cid)
    end

   exhaustion.set(cid, exausted, cooldown)
   doRemoveCondition(cid, CONDITION_ATTRIBUTES, 3)
   doRemoveCondition(cid, CONDITION_REGENERATION, 3)
   doRemoveCondition(cid, CONDITION_HASTE, 3)
   doRemoveCondition(cid, CONDITION_OUTFIT)
   local c_Pos = getCreaturePosition(cid)
   doSendMagicEffect({x = c_Pos.x+3, y = c_Pos.y + 3, z = c_Pos.z}, 1005)
   addEvent(addHearts, 400, cid)
    return true
end
           
