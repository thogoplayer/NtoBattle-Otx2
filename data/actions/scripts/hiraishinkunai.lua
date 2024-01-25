function onUse(cid, item, fromPosition, itemEx, toPosition)
local pos = fromPosition
local aqui = getPlayerPosition(cid)
local vocs = {180, 250}
local agua = {708,709,710,11,4610, 4612, 4611, 4664, 4613, 4666, 4646, 4654, 4609, 4665, 4608, 4625, 4665, 4666, 4645, 599, 601, 598, 600}
local parede = {6973,5638,5637,101,5720,5724,5713,5714,5715,5631,5632,5633,5634,5635,5639,5651,5712,5636, 1834, 3803, 9441, 3804, 4458, 4025, 1030, 986, 987, 1029, 1025, 1026, 1027, 1259, 1028, 1029, 1032, 1034, 1033, 1536, 6850, 7028, 6843, 6853, 6850, 9062, 7027, 1533, 873, 919, 874, 1037, 2700, 2708, 4472, 4475, 4471, 3388, 3373, 3363, 3398, 3408, 3417, 3420, 3407, 3368, 2701, 5130, 6170, 6166, 1596, 3361, 3362, 3363, 3364, 3365, 3366, 3367, 3368, 3369, 3370, 3371, 3372, 3373, 3374, 3375, 3376, 3377, 3378, 3379, 3380, 3381, 3382, 3383, 3384, 3385, 3386, 3387, 3388, 3389, 3390, 3391, 3392, 3393, 3394, 3395, 3396, 3397, 3398, 3399, 3400, 3401, 3402, 3403, 3404, 3405, 3406, 3407, 3408, 3409, 3410, 3411, 3412, 3413, 3414, 3415, 3416, 3417, 3418, 3419, 3420, 3421, 3422}
local pedra = {874, 919, 873, 2707, 2784, 3617, 3618, 3619, 3620, 2778, 3330, 4471, 4475, 4473,987.988, 4472, 4474, 4468, 4478, 4469, 4470, 4479, 2703, 2704, 1534, 2739, 3867, 5324, 5316, 5315, 5317, 1600, 1597, 1601}
 

	if getDistanceBetween(aqui, toPosition) >= 8 then
		return doPlayerSendTextMessage(cid, 27, "Está muito longe.") 
	elseif(not(isSightClear(aqui, toPosition, 1))) then
		return doPlayerSendTextMessage(cid, 27, "Isso é impossivel.") 
	elseif(getTilePzInfo(aqui)) then
		return doPlayerSendCancel(cid, "Não pode usar a tecnica Deus Dragão em casas ou areas protegidas.") 
	elseif(getTilePzInfo(toPosition)) then
		return doPlayerSendCancel(cid, "Não pode usar a tecnica Deus Dragão em casas ou areas protegidas.") 
	elseif(isInArray(agua, itemEx.itemid)) then
		return doPlayerSendTextMessage(cid, 27, "voce nao pode usar em agua") 
	elseif(isInArray(parede, itemEx.itemid)) then
		return doPlayerSendTextMessage(cid, 27, "voce nao pode usar em paredes") 
	elseif(isInArray(pedra, itemEx.itemid)) then
		return doPlayerSendTextMessage(cid, 27, "voce nao pode usar em pedras") 
	elseif(not(isInArray(vocs, getPlayerVocation(cid)))) then
		return doPlayerSendTextMessage(cid, 27, "Desculpe, Apenas Minato e Tobirama pode usar esta Kunai.")
	elseif(isCreature(itemEx.uid)) then
		return doPlayerSendTextMessage(cid, 27, "Desculpe, mas você não pode teletransportar em criaturas.")
	end

 local storaget1 = 122331
local storaget2 = 122332
local storaget3 = 122333
local waittime = 20.0
	if(doTeleportThing(cid, toPosition, false)) then
	local kunaiid = 12153
	local item = doCreateItemEx(kunaiid, 1)
		doSendMagicEffect(pos, 242)
		doSendMagicEffect(toPosition, 242)
		doCreatureSay(cid, "Hiraishin", 19)
		doTileAddItemEx(toPosition, item)
		doItemSetAttribute(item, "name", 'Hiraishin Kunai')
		doItemSetAttribute(item, "description", ' Pertence ao jogador '..getCreatureName(cid)..'')
		doDecayItem(item)
		if getPlayerStorageValue(cid, 4999) == -1 then
		setPlayerStorageValue(cid, 5501, toPosition.x)
        setPlayerStorageValue(cid, 5502, toPosition.y)
        setPlayerStorageValue(cid, 5503, toPosition.z)
		exhaustion.set(cid, storaget1, waittime)
		setPlayerStorageValue(cid, 5500, 0)
		setPlayerStorageValue(cid, 4999, 0)
		elseif getPlayerStorageValue(cid, 4999) == 0 then
		setPlayerStorageValue(cid, 5504, toPosition.x)
        setPlayerStorageValue(cid, 5505, toPosition.y)
        setPlayerStorageValue(cid, 5506, toPosition.z)
		setPlayerStorageValue(cid, 5500, 1)
		setPlayerStorageValue(cid, 4999, 1)
		exhaustion.set(cid, storaget2, waittime)
		elseif getPlayerStorageValue(cid, 4999) == 1 then
		setPlayerStorageValue(cid, 5507, toPosition.x)
        setPlayerStorageValue(cid, 5508, toPosition.y)
        setPlayerStorageValue(cid, 5509, toPosition.z)
		setPlayerStorageValue(cid, 5500, 2)
		setPlayerStorageValue(cid, 4999, -1)
		exhaustion.set(cid, storaget3, waittime)
        end
		return doSendDistanceShoot(pos, toPosition, 77)
	end
	 
	return doPlayerSendCancel(cid, "Desculpe nao foi possivel.")
end