local s = {
--[action id] = {pos de volta}
[33691] = {x = 2046, y = 2033, z = 7}, ------konohagakure
[33692] = {x= 1309, y=2197, z= 7}, ------suna
[33693] = {x = 1538, y = 2061, z = 7}, ------amegakure
[33694] = {x = 2656, y = 1605, z = 5}, ------kumogakure
[33695] = {x = 3070, y = 1788, z = 7}, ------getsugakure
[33696] = {x = 2312, y = 2369, z = 7}, ------mist
[33697] = {x = 2516, y = 1803, z = 7}, ------yu no kuni
}

local b = {
--[action id] = {{pos para onde ir}, {pos de volta}},
[45436] = {{x=907,y=1086,z=13}, {x=985,y=1083,z=13}}, -- Clan Psycraft
}

function onStepIn(cid, item, pos)
if isSummon(cid) then
return false
end
--
local posi = {x = 2374, y = 3115, z = 7} --posiçao do Trade Center... {x = 1313, y = 703, z = 9}
local pos = s[item.actionid]
local storage = 171877 
--
if b[item.actionid] then
   pos = b[item.actionid][2]
   posi = b[item.actionid][1] 
   storage = 171878
end
setPlayerStorageValue(cid, storage, "/"..pos.x..";"..pos.y..";"..pos.z.."/")
--
if #getCreatureSummons(cid) >= 1 then
   for i = 1, #getCreatureSummons(cid) do
       doTeleportThing(getCreatureSummons(cid)[i], {x=posi.x - 1, y=posi.y, z=posi.z}, false)
   end
end 
doTeleportThing(cid, {x=posi.x, y=posi.y, z=posi.z}, false)  
return true
end