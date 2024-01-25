local area = {
	{0,0,0},
	{0,3,0},
	{0,0,0},
}

local function onDash(cid)
	local poslook = getCreatureLookPosition(cid)
	poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
	if isWalkable(poslook) then
		if not isCreature(getThingfromPos(poslook).uid) then
			doMoveCreature(cid, getPlayerLookDirection(cid))
			doSendMagicEffect({x=getThingPos(cid).x+1, y=getThingPos(cid).y, z=getThingPos(cid).z}, 4)
			return true
		else
			doMoveCreature(cid, getPlayerLookDirection(cid))
local outfia = {lookType = 932, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0}
local outfit = getCreatureOutfit(cid)
for i, v in pairs(outfia) do
		outfit[i] = v
		end
doSetCreatureOutfit(cid, outfit, -1)
			doSendMagicEffect(getCreaturePosition(getThingfromPos(poslook).uid), 4)
			return true
		end
	end
	return true
end


function onCastSpell(cid, var)
local waittime = 5.5
local storage = 663563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
exhaustion.set(cid, storage, waittime)
	local distance = 7
	for i = 0, distance do
		addEvent(onDash,10*i,cid)
	end
	addEvent(doRemoveCondition, 300, cid, CONDITION_OUTFIT) 
	return true
end