function onUse(cid, item, fromPosition, itemEx, toPosition)
if exhaustion.check(cid, 937453) then return doPlayerSendCancel(cid, "A armadilha foi posta a pouco tempo, espere " .. exhaustion.get(cid, 937453) .. " segundos") end
if getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Invalid Position.") 
return false
end	
local c_Pos = getCreaturePosition(cid)

    if(not(isInArray({90}, getPlayerVocation(cid)))) then
		return doPlayerSendCancel(cid,  "Desculpe, Apenas tenten pode usar este pergaminho.")
	elseif getDistanceBetween(c_Pos, toPosition) >= 8 then
		return doPlayerSendCancel(cid, "Está muito longe.") 
	elseif(not(isSightClear(c_Pos, toPosition, 1))) then
		return doPlayerSendCancel(cid, "Isso é impossivel.") 
	elseif(getTilePzInfo(c_Pos)) then
		return doPlayerSendCancel(cid, "Não pode usar a tecnica em casas ou areas protegidas.") 
	elseif(not(isWalkable(toPosition))) then
		return doPlayerSendCancel(cid, "Invalid Position.")
	elseif(not(getCreatureName(cid) ==  getItemAttribute(item.uid, "dono"))) then
	    return doPlayerSendTextMessage(cid, 27, "Este pergaminho nao pertece a voce!")
	end



        exhaustion.set(cid, 937453, 40)
	    local item = doCreateItemEx(18491, 1)
		doTileAddItemEx(toPosition, item)
		doItemSetAttribute(item, "onwer", getPlayerGUID(cid))
		doDecayItem(item)
return false
end