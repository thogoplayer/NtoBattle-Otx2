--[[Script By Vodkart]]-- 
function onUse(cid, item, position, fromPosition) 
--[[ 
Nome do monstros, Coordenada de onde ele irá ser sumonado. 
Pode adicionar mais monstro caso assim desejar. 
--]] 
local M = {  
[1] = {"itachi",{x=1018, y=920, z=7}}
}  
 
local storage = 19908 -- n mexa 
 
if not isPlayer(cid) then
return false
elseif getGlobalStorageValue(storage) >= os.time() then
doCreatureSay(cid, "Parece que foi aberto recentemente, devo aguardar alguns minutos.", 19) 
return false
end
for i = 1, #M do
local a = 3
while a ~= 100 do
if a then
os.execute("ECHO "..a.."")
local a = a + 1
end
end  
doCreateMonster(M[i][1], M[i][2]) 
end    
return true  
end