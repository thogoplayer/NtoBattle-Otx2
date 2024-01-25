local function effectFollow(p_Pos, m_Pos)
while(p_Pos.x ~= m_Pos.x or p_Pos.y ~= m_Pos.y) do
doSendMagicEffect(p_Pos, 1106)
p_Pos = getPosByDir(p_Pos,getDirectionTo(p_Pos, m_Pos))
end
end

local function doMove(cid, owner, pos, speed)
	if isCreature(cid) then
	local list = getCreaturePathTo(cid, pos ,100)
	if list then
	doMoveCreature(cid, list[1])
	effectFollow(getCreaturePosition(owner), getCreaturePosition(cid))
	addEvent(doMove, speed, cid, owner, pos, speed)
    else
	setPlayerStorageValue(cid, 4444, -1)
	-- ajustPos(cid, pos)
	-- doCreatureSetNoMove(cid, false)
	end
	end
end


local exhaust = createConditionObject(CONDITION_EXHAUST, false, false, 16)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 1500)

function onUse(cid, item, fromPosition, item2, toPosition)
if(hasCondition(cid, CONDITION_EXHAUST, 16)) then
	doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
	return true
end
if not (isKankuro(cid) or isSasori(cid)) then
return doPlayerSendCancel(cid, "Used only by Sasori and Kankuro.")
end
local summons = getCreatureSummons(cid)

if #summons < 1 then
return doPlayerSendCancel(cid, "You don't have puppets.")
end

if isCreature(item2.uid) and getCreatureMaster(item2.uid) == cid then
return doCreatureSetNoMove(item2.uid, false) and setPlayerStorageValue(item2.uid, 4444, -1)
end

local control = getItemAttribute(item.uid, "control") or 1
local m_control = summons[control]

if item.uid == item2.uid then
local att = (control < (#summons > 0 and #summons or 3) and control+1 or 1)
local puppet = getCreatureName(summons[att]) 
doItemSetAttribute(item.uid, "control", att)
doItemSetAttribute(item.uid, "description", "Puppet control : "..puppet.."")
return doPlayerSendCancel(cid, "You have chosen the "..puppet.."")
end

if m_control then
if getCreatureName(m_control) == getCreatureName(cid) then return doPlayerSendCancel(cid, "Used only on puppets") end
if getCreatureStorage(m_control, 4444) < 1 then
doCreatureSetNoMove(m_control, true)
doMove(m_control, cid, topos, getCreatureBaseSpeed(m_control)/3)
setPlayerStorageValue(m_control, 4444, 1)
doAddCondition(cid, exhaust)
else return doPlayerSendCancel(cid, "Wait until your puppet completes the course.") end
else return doPlayerSendCancel(cid, "You don't own this puppet.") end
end