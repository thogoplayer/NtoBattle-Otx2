local tps = {
                        ["Infernal Demon"] = {pos = {x = 1942, y = 2345, z = 7}, toPos = {x = 914, y = 1158, z = 6}, time = 60},
						["Akatsuki Pain"] = {pos = {x= 3331, y=2054, z= 10}, toPos = {x= 2961, y=1805, z= 7}, time = 60},
					
}
local function removeTp(tp)
local t = getTileItemById(tp.pos, 5023).uid
return t > 0 and doRemoveItem(t) and doSendMagicEffect(tp.pos, CONST_ME_POFF)
end
function onDeath(cid)
                        local tp = tps[getCreatureName(cid)]
                        if isMonster(cid) and tp then
                        if getCreatureName(cid) == "Akatsuki Pain" then
						local ts = doCreateTeleport(5023, tp.toPos, tp.pos)
						doItemSetAttribute(ts, "aid", 4742)
						else
                        doCreateTeleport(5023, tp.toPos, tp.pos)
						end
                        doCreatureSay(cid, "the portal will be closed in "..tp.time.." Seconds.", TALKTYPE_ORANGE_1)
                        addEvent(removeTp, tp.time*1000, tp)
                        end
                        return true
end