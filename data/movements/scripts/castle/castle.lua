local storage_guild = getGlobalStorageValue(123123)  -- A storage configurada em Castle.lua
local pos = {x = 160, y = 54, z = 7}
function onStepIn(cid, item, position, fromPosition)
if isPlayer(cid) == true  then
if getPlayerGuildId(cid) ~= storage_guild then
doTeleportThing(cid, pos) 
doSendMagicEffect(getThingPos(cid), 37)
doPlayerSendTextMessage(cid, 22, "You no longer have acess to the castle!")  
end      
end    
return true
end