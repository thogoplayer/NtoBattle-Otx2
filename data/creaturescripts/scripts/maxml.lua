function onAdvance(cid, skill, oldlevel, newlevel)
local maxml = 150
if skill == 100 then
if newlevel >= maxml then
doPlayerSetMagicRate(cid, 0)
setPlayerStorageValue(cid, 20130314, maxml)
end
end
return true
end