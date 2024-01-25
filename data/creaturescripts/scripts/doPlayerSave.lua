function doPlayerSaveTime(cid)
if isPlayer(cid) then
doPlayerSave(cid)
addEvent(doPlayerSaveTime, 5*60*1000, cid) 
end
end
