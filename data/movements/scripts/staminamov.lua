local termais_Pos = {
		{{x= 2473, y=1764, z= 7}, {x= 2475, y=1770, z= 7}},
		{{x= 2091, y=1989, z= 7}, {x= 2092, y=1999, z= 7}},
		{{x= 2471, y=1779, z= 7}, {x= 2472, y=1785, z= 7}}		
} 
function getPosInTermal(pos)
for i = 1, #termais_Pos do
if isInRange(pos, termais_Pos[i][1], termais_Pos[i][2]) then
return true
end
end
return false
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if getPlayerStorageValue(cid, 747654) == 1 then
	setPlayerStorageValue(cid,747654,2)		
	elseif isInRange(fromPosition, {x= 2550, y=1749, z= 7}, {x= 2574, y=1756, z= 7}) then
	setPlayerStorageValue(cid,747654,-1)
	toPosition.y = toPosition.y+1
	doTeleportThing(cid, toPosition)
	elseif isInRange(fromPosition, {x= 2098, y=1989, z= 7}, {x= 2099, y=1999, z= 7}) then
	setPlayerStorageValue(cid,747654,-1)
	toPosition.y = toPosition.y+1
	doTeleportThing(cid, toPosition)
	elseif getPosInTermal(fromPosition) then
	toPosition.x = toPosition.x+1
	setPlayerStorageValue(cid,747654,-1)
	doTeleportThing(cid, toPosition)
	else
	doTeleportThing(cid, fromPosition)
	doPlayerSendCancel(cid, "You need to pay [Staminer]Mavis to get in.")
	end
return true
end