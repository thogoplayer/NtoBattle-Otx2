local rewards = {
    {itemid = 11067, chance = 50}, 
    {itemid = 18317, chance = 40}, 
    {itemid = 18318, chance = 20}, 
    {itemid = 17624, chance = 50}, 
    {itemid = 17632, chance = 40}, 
    {itemid = 17640, chance = 20}, 
    {itemid = 11099, chance = 60}, 
    {itemid = 13533, chance = 40}, 
    {itemid = 13542, chance = 40},  
    {itemid = 18319, chance = 40},  
    {itemid = 17648, chance = 40},  
    -- {itemid = 11136, chance = 50},  
    -- {itemid = 11137, chance = 50},  
    -- {itemid = 11076, chance = 50},  
    -- {itemid = 11079, chance = 50},  
    -- {itemid = 18988, chance = 40},  
    -- {itemid = 18989, chance = 40},  
    -- {itemid = 18985, chance = 40},  
    -- {itemid = 18314, chance = 40},  
    -- {itemid = 18991, chance = 20},  
    -- {itemid = 18986, chance = 20},  
    -- {itemid = 18990, chance = 20},  
    -- {itemid = 18315, chance = 20},  
    {itemid = 11223, chance = 50},  
    {itemid = 2391, chance = 50},  
    {itemid = 16379, chance = 50},  
    {itemid = 13557, chance = 50},  
    {itemid = 13557, chance = 20},  
    {itemid = 13629, chance = 20},  
    {itemid = 15765, chance = 20},  
    {itemid = 13593, chance = 20},  
    {itemid = 13548, chance = 20},  
    {itemid = 17647, chance = 20},  
    {itemid = 17504, chance = 20},  
    {itemid = 13596, chance = 20},  
    {itemid = 13554, chance = 20},  
    {itemid = 13623, chance = 20},  
    {itemid = 17675, chance = 20},  
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