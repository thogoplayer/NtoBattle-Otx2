local rewards = {
    {itemid = 11123, chance = 80}, 
    {itemid = 2397, chance = 80}, 
    {itemid = 17090, chance = 100}, 
    {itemid = 18487, chance = 80}, 
    {itemid = 7428, chance = 80}, 
    {itemid = 10300, chance = 80}, 
    {itemid = 15486, chance = 60}, 
    {itemid = 15779, chance = 80}, 
    {itemid = 17496, chance = 80}, 
    

}

local function sorteiaPremio(rewardlist)
    local possible = {}
    for i, v in pairs(rewardlist) do
        local sort = math.random(1, 10000)
        if v.chance*100 >= sort then
            possible[#possible + 1] = v
        end
    end
    local reward = rewardlist[1]
    if #possible > 0 then
        reward = possible[math.random(1, #possible)]
    end 
    return reward
end

function onUse(cid, item)
    local reward = sorteiaPremio(rewards).itemid
    doPlayerAddItem(cid, reward)
    doPlayerSendTextMessage(cid, 27, "Voce ganhou 1x "..getItemNameById(reward))
	doRemoveItem(item.uid)
    return true
end