--[[Script By Vodkart]]-- 
function onUse(cid, item, position, fromPosition) 
local storage = 19908 -- n mexa 
local time_summon = 15 -- intervalo de tempo em minutos para nao summonar novamente 
 
if getGlobalStorageValue(storage) >= os.time() then
doCreatureSay(cid, "Parece que foi aberto recentemente, devo aguardar alguns minutos.", 19) 
return false
end
doCreateMonster("nidaime",{x= 2053, y=2048, z= 7}) 
doCreatureSay(cid, "Nossa, Eh um clone perfeito de Nidaime!", 19)  
setGlobalStorageValue(storage, os.time()+time_summon*60)   
return true  
end