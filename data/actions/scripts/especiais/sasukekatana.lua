local function PegarKatana(cid, position)
    local item = getTileItemById(position, 14007).uid
     if item > 0 and getItemAttribute(item, "dono") == getCreatureName(cid) then
	 local s = doPlayerAddItem(cid, 10524)
	 doItemSetAttribute(s, "description", "Owner: " .. getCreatureName(cid))
	 doItemSetAttribute(s, "dono", ""..getCreatureName(cid).."")
	 doRemoveItem(item)
	 end
end

local exhaust = createConditionObject(CONDITION_EXHAUST, false, false, 16)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 1000)

function onUse(cid, item, fromPosition, itemEx, toPosition)
if(hasCondition(cid, CONDITION_EXHAUST, 16)) then
	doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
	return true
end
if getPlayerStorageValue(cid, 16700) > 1 then doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!") return false end
if exhaustion.check(cid, 937451) then return doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, 937451) .. " segundos para marcar a kusanagi novamente") end
if exhaustion.check(cid, 937452) then return doPlayerSendCancel(cid, "A kusanagi foi marcada a pouco tempo, pegue-a agora ou espere " .. exhaustion.get(cid, 937452) .. " segundos para marca-la novamente") end

if getCreatureIn(cid, AREA_KAMUI) or getCreatureIn(cid, AREA_GENJUTSU) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Invalid Area.") 
return false
end
local c_Pos = getCreaturePosition(cid)

    if(not(isInArray({10}, getPlayerVocation(cid)))) then
		return doPlayerSendCancel(cid,  "Desculpe, Apenas Sasuke pode usar esta Kunai.")
	elseif getDistanceBetween(c_Pos, toPosition) >= 8 then
		return doPlayerSendCancel(cid, "Está muito longe.") 
	elseif(not(isSightClear(c_Pos, toPosition, 1))) then
		return doPlayerSendCancel(cid, "Isso é impossivel.") 
	elseif(getTilePzInfo(c_Pos)) then
		return doPlayerSendCancel(cid, "Não pode usar a tecnica em casas ou areas protegidas.") 
	elseif(not(isWalkable(toPosition))) then
		return doPlayerSendCancel(cid, "Invalid Position.") 
	-- elseif isInRange(toPosition, examechunin1, examechunin2) or isInRange(toPosition, examechunin3, examechunin4) then
	    -- return doPlayerSendTextMessage(cid, 27, "Você não pode usar Katana nesta area!")
	elseif(not(getCreatureName(cid) ==  getItemAttribute(item.uid, "dono"))) then
	    return doPlayerSendTextMessage(cid, 27, "Esta Katana não pertence a você!")
	end


        doAddCondition(cid, exhaust)
	    doRemoveItem(item.uid)
        exhaustion.set(cid, 937452, 10)
	    local item = doCreateItemEx(14007, 1)
	    setPlayerStorageValue(cid, 15501, toPosition.x)
	    setPlayerStorageValue(cid, 15502, toPosition.y)
	    setPlayerStorageValue(cid, 15503, toPosition.z)
		doTileAddItemEx(toPosition, item)
		doItemSetAttribute(item, "dono", getCreatureName(cid))
		doItemSetAttribute(item, "description", 'Owner:  '..getCreatureName(cid)..'')
		addEvent(PegarKatana, 10000, cid, toPosition)
		doDecayItem(item)
		doSendDistanceShoot(c_Pos, toPosition, 46)
return true
end