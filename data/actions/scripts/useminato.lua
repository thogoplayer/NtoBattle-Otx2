--[[Script By Vodkart]]-- 
function onUse(cid, item, position, fromPosition) 
local storage = 18905 -- n mexa 
local time_summon = 5 -- intervalo de tempo em minutos para nao summonar novamente 
 
if getGlobalStorageValue(storage) >= os.time() then
doCreatureSay(cid, "Esta alavanca foi ativada recentemente, aguarde um pouco ", 19) 
return false
end
doCreateMonster("bunshin yondaime",{x = 3211, y = 2231, z = 2}) 
doCreatureSay(cid, "Parece que um clone do grande minato surgiu ao topo!", 19)  
setGlobalStorageValue(storage, os.time()+time_summon*60)   
return true  
end
