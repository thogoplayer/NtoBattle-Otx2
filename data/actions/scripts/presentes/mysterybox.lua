local rewards = {
    {itemid = 11672, chance = 40}, 
    {itemid = 11127, chance = 40}, 
    {itemid = 11079, chance = 80}, 
    {itemid = 18314, chance = 70}, 
    {itemid = 18315, chance = 60}, 
    {itemid = 18316, chance = 40}, 
    {itemid = 16379, chance = 80}, 
    {itemid = 2391, chance = 80}, 
    {itemid = 11223, chance = 80}, 
    {itemid = 11099, chance = 80}, 
    {itemid = 11056, chance = 70}, 
    {itemid = 5921, chance = 60}, 
    {itemid = 10675, chance = 80}, 
    {itemid = 10676, chance = 80}, 
    {itemid = 17454, chance = 80}, 
    {itemid = 11045, chance = 80}, 
    {itemid = 18559, chance = 80}, 
    {itemid = 18558, chance = 80}, 
    {itemid = 17457, chance = 80}, 
    {itemid = 11100, chance = 80}, 
    {itemid = 11160, chance = 80}, 

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