local rewards = {
    {itemid = 10354, chance = 80}, 
    {itemid = 15785, chance = 80}, 
    {itemid = 2486, chance = 70}, 
    {itemid = 11090, chance = 80}, 
    {itemid = 18302, chance = 60}, 
    {itemid = 18994, chance = 60}, 
    {itemid = 13544, chance = 50}, 
    {itemid = 18311, chance = 60}, 
    {itemid = 11147, chance = 70}, 
    {itemid = 12288, chance = 70}, 
    {itemid = 12256, chance = 70}, 
    {itemid = 11678, chance = 80}, 
    {itemid = 10706, chance = 90}, 
    {itemid = 10708, chance = 100}, 
    {itemid = 12300, chance = 100}, 
    {itemid = 11032, chance = 100}, 
    {itemid = 15773, chance = 100}, 
    {itemid = 15485, chance = 100}, 
    {itemid = 15782, chance = 100}, 
    {itemid = 15481, chance = 100}, 
    {itemid = 15480, chance = 100}, 
    {itemid = 10414, chance = 100}, 
    {itemid = 17500, chance = 100}, 
    {itemid = 13646, chance = 100}, 
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