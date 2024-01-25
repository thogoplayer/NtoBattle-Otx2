
local config = {
    positions = {
	    [0] = {{0, 1, 1, 1, 0}, 
 	           {1, 1, 1, 1, 1}, 
               {1, 1, 1, 1, 1},
		       {0, 0, 2, 0, 0}},
			   
	    [1] = {{0, 0, 1, 1, 0}, 
 	           {0, 0, 1, 1, 1}, 
               {2, 0, 1, 1, 1},
		       {0, 0, 1, 1, 1},
			   {0, 0, 1, 1, 0}},
			   
			   
	    [2] = {{0, 0, 2, 0, 0}, 
 	           {1, 1, 1, 1, 1}, 
               {1, 1, 1, 1, 1},
		       {0, 1, 1, 1, 0}},
			   
			   
			   
	    [3] = {{0, 1, 1, 0}, 
 	           {1, 1, 1, 0}, 
               {1, 1, 1, 2},
		       {1, 1, 1, 0},
			   {0, 1, 1, 0}},
	           },
    effect = 197,          --Efeito.
    trapIds = {14465, 14466, 14464, 14463, 14462, 14461, 14460},          --ID da parede.
    cooldown = 5 ,
    storage = 9571,
}

function onCastSpell(cid)
if getPlayerStorageValue(cid, config.storage) > os.time() then
doPlayerSendCancel(cid, "Wait "..getPlayerStorageValue(cid, config.storage) - os.time().." second(s).")
return false
end

setPlayerStorageValue(cid, config.storage, os.time() + config.cooldown)
doCreatureSetNoMove(cid, false)
for _, pos in pairs(getPosfromArea(cid, config.positions[getPlayerLookDir(cid)])) do
    for _, itemid in pairs(config.trapIds) do
    trapItem = getTileItemById(pos, itemid).uid
    end
    if trapItem > 0 then
    doRemoveItem(trapItem)
	doSendMagicEffect(pos, config.effect)
    end
end

return true
end