--[[Script By Vodkart]]-- 
function onUse(cid, item, position, fromPosition) 
local storage = 19923 -- n mexa 
local time_summon = 15 -- intervalo de tempo em minutos para nao summonar novamente 
 
if not isPlayer(cid) then
return false
elseif getGlobalStorageValue(storage) >= os.time() then
doCreatureSay(cid, "the seal has been undone recently, wait a while.", 19) 
return false
end

local npc = doCreateMonster("Rikudou Sennin", {x = 2912, y = 1547, z = 11})
addEvent(removeCreature, 10*TIME_MINUTES, npc)
doCreatureSay(cid, "Wow this is the sabio of the six paths!", 19)  
setGlobalStorageValue(storage, os.time()+time_summon*60)   
return true  
end