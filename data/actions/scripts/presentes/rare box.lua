local rewards = {
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
    {itemid = 11067, chance = 50}, 
    {itemid = 18317, chance = 40}, 
    {itemid = 18318, chance = 20}, 
    {itemid = 17624, chance = 50}, 
    {itemid = 17632, chance = 40}, 
    {itemid = 17640, chance = 20}, 
    {itemid = 11099, chance = 60}, 
    {itemid = 13533, chance = 40}, 
    {itemid = 13542, chance = 40}, 
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