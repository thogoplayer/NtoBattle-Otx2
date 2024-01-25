local config = {
    rewards_id = {2494, 2472, 2514, 2493, 2470, 2195, 2173, 2160}, -- Rewards ID
    crystal_counts = 20, -- used only if on rewards_id you have crystal coins (ID: 2160).
    }

function onStepIn(cid, item, frompos, item2, topos)
        
local random_item = config.rewards_id[math.random(1, #config.rewards_id)]
local item_name =  getItemNameById(random_item)

if doPlayerSetTown(cid, 1) then
  if(random_item == 2160) then
                        doPlayerAddItem(cid, random_item, config.crystal_counts)
                        doPlayerAddItem(cid, 10138, 1)
		       doPlayerSendTextMessage(cid,25, 'Your team won the dota round! You winner: '.. config.crystal_counts ..' '.. item_name ..'s and dota winner medal!')
                else
                     doPlayerSendTextMessage(cid,25, 'Your team won the dota round! You winner: '.. item_name ..' and dota winner medal!')
                        doPlayerAddItem(cid, random_item, 1)
                        doPlayerAddItem(cid, 10138, 1)
                end
end
return true
end