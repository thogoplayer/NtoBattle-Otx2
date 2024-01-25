local tps = {
                        ["Noel Event"] = {pos = {x = 564, y = 894, z = 10}, toPos = {x = 819, y = 833, z = 7}, time = 60},
}
function onDeath(cid)
local portentagem = math.random(1,100)
	local greenpresent = doCreateItemEx(12225, 1)
	local redpresent = doCreateItemEx(12226, 1)
	local yellowpresent = doCreateItemEx(12227, 1)
	local orangepresent = doCreateItemEx(12228, 1)
                        local tp = tps[getCreatureName(cid)]
                        if tp then
						local poss = getCreaturePosition(cid)
						local pos1 = {x=poss.x+(math.random(-3,3)), y=poss.y+(math.random(-3,3)), z=poss.z}
						local pos2 = {x=poss.x+(math.random(-3,3)), y=poss.y+(math.random(-3,3)), z=poss.z}
						local pos3 = {x=poss.x+(math.random(-3,3)), y=poss.y+(math.random(-3,3)), z=poss.z}
						local pos4 = {x=poss.x+(math.random(-3,3)), y=poss.y+(math.random(-3,3)), z=poss.z}
						local pos5 = {x=poss.x+(math.random(-3,3)), y=poss.y+(math.random(-3,3)), z=poss.z}
						if portentagem >= 1 and portentagem < 20 then
						doTileAddItemEx(pos1, greenpresent)
						elseif portentagem >= 20 and portentagem < 40 then
						doTileAddItemEx(pos1, greenpresent)
						doTileAddItemEx(pos2, yellowpresent)
						elseif portentagem >= 40 and portentagem < 60 then
						doTileAddItemEx(pos3, greenpresent)
						doTileAddItemEx(pos1, greenpresent)
						doTileAddItemEx(pos2, yellowpresent)
						elseif portentagem >= 60 and portentagem < 80 then
						doTileAddItemEx(pos3, yellowpresent)
						doTileAddItemEx(pos4, orangepresent)
						elseif portentagem >= 80 and portentagem < 99 then
						doTileAddItemEx(pos2, greenpresent)
						doTileAddItemEx(pos3, yellowpresent)
						doTileAddItemEx(pos4, orangepresent)
						elseif portentagem >= 99 and portentagem < 101 then
						doTileAddItemEx(pos2, greenpresent)
						doTileAddItemEx(pos3, yellowpresent)
						doTileAddItemEx(pos4, orangepresent)
						doTileAddItemEx(pos5, orangepresent)
						end
                        doCreatureSay(cid, "Hahaha, Voltarei!!.", TALKTYPE_ORANGE_1)
                        end
                        return true
end