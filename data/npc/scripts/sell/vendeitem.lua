local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


-------BUYABLE
shopModule:addBuyableItem({'tobi war mask'},                   7380, 5000000,       'tobi war mask')
shopModule:addBuyableItem({'yondaime tunic '},				7408, 5000000,		'yondaime tunic')
shopModule:addBuyableItem({'sennin legs'},                   2431, 5000000,       'sennin legs')
shopModule:addBuyableItem({'vital boots'},         7402, 5000000,       'vital boots')
shopModule:addBuyableItem({'kage shuriken'}, 2659, 5000000,       'kage shuriken')
shopModule:addBuyableItem({'Kongounyoi staff'}, 2421, 5000000,       'Kongounyoi staff')
shopModule:addBuyableItem({'hokage hat'},                   3967, 15000000,       'hokage hat')
shopModule:addBuyableItem({'lendary armor'},				8870, 15000000,		'lendary armor')
shopModule:addBuyableItem({'lendary legs'},                   7413, 15000000,       'lendary legs')
shopModule:addBuyableItem({'lendary boots'},         2642, 15000000,       'lendary boots')
shopModule:addBuyableItem({'kimimaro whip'}, 2396, 15000000,       'kimimaro whip')
shopModule:addBuyableItem({'lendary sword'},3962, 15000000,       'lendary sword')
shopModule:addBuyableItem({'mizukage hat'},                   2446, 10000000,       'mizukage hat')
shopModule:addBuyableItem({'kage armor'},				2139, 10000000,		'kage armor')
shopModule:addBuyableItem({'hokage legs'},                   2429, 10000000,       'hokage legs')
shopModule:addBuyableItem({'zabusa boots'},         2646, 10000000,       'zabusa boots')
shopModule:addBuyableItem({'gourd sand'},2429, 15000000,       'gourd sand')



npcHandler:addModule(FocusModule:new())