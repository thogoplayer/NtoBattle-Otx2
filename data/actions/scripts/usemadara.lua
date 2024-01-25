function onUse(cid, item, position, fromPosition)
local storage = 18905 -- n mexa 
local time_summon = 10 -- intervalo de tempo em minutos para nao summonar novamente 
 
if checkMonstersInArea({{x = 1761, y = 2263, z = 8},{x = 1775, y = 2277, z = 8}},{"Madara"}) then 
return doCreatureSay(cid, "Ja tem um madara wow!", 19)
end
-- if getGlobalStorageValue(storage) >= os.time() then
-- doCreatureSay(cid, "Parece que foi usado recentemente, devo aguardar alguns minutos!", 19) 
-- return false
-- end
doCreateMonster("madara", {x= 1767, y=2269, z= 8}) 
doCreatureSay(cid, "Nossa, Eh mesmo madara!", 19)  
-- setGlobalStorageValue(storage, os.time()+time_summon*60)   
return true  
end