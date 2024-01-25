function onAdvance(cid)
if(getPlayerMagLevel(cid) >= 150) then
doPlayerSetMagicRate(cid, 1)
end
return true
end