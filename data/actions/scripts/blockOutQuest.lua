local bossPositions = {
["Rikudou Sennin"] = {{x= 2900, y=1540, z= 11}, {x= 2922, y=1569, z= 11}},
-- ["Madara"] = {{x=x, y=y, z=z}, {x=x, y=y, z=z}},

}


function onUse(cid, item, fromPosition, itemEx, toPosition)
for boss, positions in pairs(bossPositions) do
    if checkMonstersInArea(positions,{boss}) then
    doPlayerSendCancel(cid, "Exit blocked, defeat Boss.")
    return false
    end
end

return true
end