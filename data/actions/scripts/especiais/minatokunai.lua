local exhaust = createConditionObject(CONDITION_EXHAUST, false, false, 16)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 1500)

function onUse(cid, item, fromPosition, itemEx, toPosition)
if(hasCondition(cid, CONDITION_EXHAUST, 16)) then
	doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
	return true
end
if getCreatureIn(cid, AREA_KAMUI) or getCreatureIn(cid, AREA_GENJUTSU) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Invalid Area.") 
return false
end

local c_Pos = getCreaturePosition(cid)
    if(not(isInArray({180, 250}, getPlayerVocation(cid)))) then
		return doPlayerSendCancel(cid,  "Desculpe, Apenas Minato e Tobirama pode usar esta Kunai.")
	elseif getDistanceBetween(c_Pos, toPosition) >= 7 then
		return doPlayerSendCancel(cid, "Está muito longe.") 
	elseif(not(isSightClear(c_Pos, toPosition, 1))) then
		return doPlayerSendCancel(cid, "Isso é impossivel.") 
	elseif(getTilePzInfo(c_Pos)) then
		return doPlayerSendCancel(cid, "Não pode usar a tecnica Deus Dragão em casas ou areas protegidas.") 
	elseif(not(isWalkable(toPosition))) then
		return doPlayerSendCancel(cid, "Invalid Position.") 
	end


	if(doTeleportThing(cid, toPosition, false)) then
	doAddCondition(cid, exhaust)
	local item = doCreateItemEx(11676, 1)
		doSendMagicEffect(c_Pos, 242)
		doSendMagicEffect(toPosition, 242)
		doCreatureSay(cid, "Hiraishin", 19)
		doTileAddItemEx(toPosition, item)
		doItemSetAttribute(item, "name", 'Hiraishin Kunai')
		doItemSetAttribute(item, "description", ' Pertence ao jogador '..getCreatureName(cid)..'')
		doDecayItem(item)
		setPlayerStorageValue(cid, 15501, toPosition.x)
	    setPlayerStorageValue(cid, 15502, toPosition.y)
	    setPlayerStorageValue(cid, 15503, toPosition.z)
		exhaustion.set(cid, 15504, 10)
		return doSendDistanceShoot(c_Pos, toPosition, 77)
	end
	 
	return doPlayerSendCancel(cid, "Desculpe nao foi possivel.")
end
