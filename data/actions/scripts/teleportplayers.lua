local lvl = 500
local entrada = {
        {x = 154, y = 60, z = 7},
        {x = 155, y = 60, z = 7},
        {x = 156, y = 60, z = 7},
        {x = 157, y = 60, z = 7},
        {x = 158, y = 60, z = 7}                
    }
local saida = {x = 153, y = 62, z = 7}  
function onUse(cid, item, fromPosition, itemEx, toPosition)
local check = {}
    for _, k in ipairs(entrada) do
        local x = getTopCreature(k).uid
        if (x > 0 and isPlayer(x) and getPlayerLevel(x) >= lvl) then
            check[#check+1] = x
        end
    end
        for _, pid in pairs(check) do
        doSendMagicEffect(getPlayerPosition(pid), CONST_ME_POFF)
        doTeleportThing(pid, saida)
         doSendMagicEffect(getPlayerPosition(pid), CONST_ME_ENERGYAREA)
    end
    doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
    return true
end