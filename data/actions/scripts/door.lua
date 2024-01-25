--[[Script By Vodkart]]-- 
function onUse(cid, item, position, fromPosition) 
--[[ 
Nome do monstros, Coordenada de onde ele irá ser sumonado. 
Pode adicionar mais monstro caso assim desejar. 
--]] 
local storage = 19928 -- n mexa  
 if getGlobalStorageValue(storage) >= os.time() then
doCreatureSay(cid, "Parece que foi aberto recentemente, devo aguardar alguns minutos.", 19) 
return false
end
doCreateMonster("itachi", {x=1018, y=920, z=7})   
return true  
end