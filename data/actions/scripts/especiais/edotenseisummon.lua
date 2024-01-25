edo_exc = {
["Sakura Haruno"] = function(player, edo)
                    addEvent(function()
                        if isCreature(player) and isCreature(edo) then
						if getCreatureHealth(player) < getCreatureMaxHealth(player) then
						local heal_points = math.ceil(math.random(3000, 5000))
						doCreatureAddHealth(player, heal_points)
						doPlayerSendTextMessage(player, 27, "[Edo Tensei] Sakura curou seu HP em "..heal_points.." points")
						end
						edo_exc["Sakura Haruno"](player, edo)
                        end
                    end, 5* TIME_SECONDS)	
                    end,
["Ino Yamanaka"] = function(player, edo)
                    addEvent(function()
                        if isCreature(player) and isCreature(edo) then
						if getCreatureHealth(player) < getCreatureMaxHealth(player) then
						local heal_points = math.ceil(math.random(3500, 4500))
						doCreatureAddHealth(player, heal_points)
						doPlayerSendTextMessage(player, 27, "[Edo Tensei] Sakura curou seu HP em "..heal_points.." points")
						end
						edo_exc["Ino Yamanaka"](player, edo)
                        end
                    end, 5* TIME_SECONDS)	
                    end,
					
["Tsunade"] = function(player, edo)
                    addEvent(function()
                        if isCreature(player) and isCreature(edo) then
						if getCreatureHealth(player) < getCreatureMaxHealth(player) then
						local heal_points = math.ceil(math.random(1000, 7000))
						doCreatureAddHealth(player, heal_points)
						doPlayerSendTextMessage(player, 27, "[Edo Tensei] Tsunade curou seu HP em "..heal_points.." points")
						end
						edo_exc["Tsunade"](player, edo)
                        end
                    end, 5* TIME_SECONDS)	
                    end,
}

-- AREA_BLOCK_EDOTENSEI = {
        -- {x=962, y=885, z=7},{x=973, y=892, z=7},
        -- {x=979, y=901, z=7},{x=991, y=905, z=7}
-- }



function onUse(cid, item, frompos, item2, topos)

if not isInArray({210, 250}, getPlayerVocation(cid)) then
return doPlayerSendTextMessage(cid, 27, "Apenas Orochimaru e Tobirama pode usar este item")
end

local limit = isPremium(cid) and 3 or 2

-- if getCreatureIn(cid, AREA_BLOCK_EDOTENSEI)then
-- return doPlayerSendCancel(cid, "Você não pode usar edo tensei nesta area!")
-- end

if(#getCreatureSummons(cid) >= limit) then
return doPlayerSendCancel(cid, "Você ja possui "..limit.." reecarnaçoes")
end

local edo_name = getItemAttribute(item.uid, "edotensei")
edo = doCreateMonster("edo "..edo_name.."", topos)
if edo then
doConvinceCreature(cid, edo)
doSendMagicEffect(topos, 357)
doRemoveItem(item.uid)
registerCreatureEvent(edo, "PlayerAntKillSummon")
if edo_exc[edo_name] then
edo_exc[edo_name](cid, edo)
end
doPlayerSendCancel(cid, "Você resussitou um "..edo_name.."")
end
return true
end
