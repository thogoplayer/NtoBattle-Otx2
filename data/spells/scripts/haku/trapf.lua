local remove_time = 10 -- tempo em segundos para remover as magic wall
local item_id = 8633 -- id da magic wall

function onCastSpell(cid, var)

local pos = getThingPosition(getCreatureTarget(cid))
posTile1 = {x=pos.x+1,y=pos.y+1,z=pos.z,stackpos=1}
posTile2 = {x=pos.x+1,y=pos.y,z=pos.z,stackpos=1}
posTile3 = {x=pos.x+1,y=pos.y-1,z=pos.z,stackpos=1}
posTile4 = {x=pos.x+1,y=pos.y-2,z=pos.z,stackpos=1}
posTile5 = {x=pos.x+1,y=pos.y+2,z=pos.z,stackpos=1}

posAll = {posTile1,posTile2,posTile3,posTile4,posTile5}

for i=1, #posAll do
    if isWalkable(posAll[i]) then
        doCreateItem(item_id, 1, posAll[i])
    end
end 
addEvent(removeItem, remove_time*1000, posAll)
return true
end

function removeItem(posAll)
    for i=1, #posAll do
        for j=0, 255 do
            pos_stack = {x=posAll.x,y=posAll.y,z=posAll.z,stackpos=j}
            removeTile = getThingfromPos(pos_stack)
            if removeTile.itemid == item_id then
                doRemoveItem(removeTile.uid)
            end
        end
    end
end