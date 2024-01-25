--[[Script By Vodkart]]-- 
function onUse(cid, item, position, fromPosition)

local storage = 199410 -- n mexa 
local time_summon = 60 -- intervalo de tempo em minutos para nao summonar novamente 
 
if getGlobalStorageValue(storage) >= os.time() then
doCreatureSay(cid, "It looks like it was recently opened, we should wait 1 hour.", 19) 
return false
end
local npc = doCreateNpc("senjuu hashirama", {x = 1338, y = 2778, z = 12})
addEvent(removeCreature, 10*TIME_MINUTES, npc)
doCreatureSay(cid, "EDO TENSEI!!!", 19)  
setGlobalStorageValue(storage, os.time()+time_summon*60)   
return true  
end