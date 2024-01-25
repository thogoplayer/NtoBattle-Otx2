local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'icy legs'},                   2428, 15000,       'icy legs')
shopModule:addSellableItem({'haku armor'},         2422, 5000,       'haku armor')
shopModule:addSellableItem({'shikamaru armor'},                   7381, 5000,       'shikamaru armor')
shopModule:addSellableItem({'sakura armor'},         7430, 5000,       'sakura armor')
shopModule:addSellableItem({'jounin armor'},                   2400, 10000,       'jounin armor')
shopModule:addSellableItem({'chouji armor'},                   8852, 10240,       'chouji armor')
shopModule:addSellableItem({'anbu armor'},                   8874, 15000,       'anbu armor')
shopModule:addSellableItem({'orochimaru tunic'},                   2534, 60000,       'orochimaru tunic')

shopModule:addSellableItem({'anbu mask'},         7431, 5000,       'anbu mask')
shopModule:addSellableItem({'leaft jounin protector'},         7427, 7000,       'leaft jounin protector')
shopModule:addSellableItem({'chakra mask'},                   2447, 11030,       'chakra mask')        
shopModule:addSellableItem({'health mask'},                   2451, 11025,       'health mask')        
shopModule:addSellableItem({'katana'},                   2382, 2090,       'katana')    
shopModule:addSellableItem({'dual slayer'},                   7867, 10000,       'dual slayer')      

shopModule:addSellableItem({'scytle'},                     2398, 25000,       'scytle')
shopModule:addSellableItem({'shukaku spear'},                           7862, 15000,       'shukaku spear')
shopModule:addSellableItem({'lee taijutsu glove'},                     2372, 7060,       'lee taijutsu glove')
shopModule:addSellableItem({'jounin glove'},         2648, 10350,       'jounin glove')
shopModule:addSellableItem({'chakra glove'},                     2383, 12000,       'chakra glove')
shopModule:addSellableItem({'raikage glove'},                     2516, 17000,       'raikage glove')
shopModule:addSellableItem({'speed boots'},         2525, 10000,       'speed boots')

shopModule:addSellableItem({'chakra boots'},				7417, 13150,		'chakra boots')
shopModule:addSellableItem({'akatsuki boots'},				2529, 23500,		'akatsuki boots')


-------BUYABLE
shopModule:addBuyableItem({'orochimaru tunic'},                   2534, 40000,       'orochimaru tunic')
shopModule:addBuyableItem({'akatsuki boots'},				2529, 20000,		'akatsuki boots')
shopModule:addBuyableItem({'dual slayer'},                   7867, 10000,       'dual slayer')
shopModule:addBuyableItem({'chunin legs'}, 8851, 2950,       'chunin legs')
shopModule:addBuyableItem({'speed boots'}, 2525, 50000,       'speed boots')
shopModule:addBuyableItem({'chakra boots'}, 7417, 95000,       'chakra boots')
shopModule:addBuyableItem({'elite kunai'}, 2416, 610,       'elite kunai')
shopModule:addBuyableItem({'taijutsu glove'}, 2380, 545,       'taijutsu glove')
shopModule:addBuyableItem({'katana imperium'}, 2376, 50000,       'katana imperium')
shopModule:addBuyableItem({'sound glove'}, 2435, 50000,       'sound glove')

shopModule:addBuyableItem({'chakra armor'},         2397, 5000,       'chakra armor')
shopModule:addBuyableItem({'jounin armor'},         2400, 25000,       'jounin armor')
shopModule:addBuyableItem({'kankuru hat'},                   7438, 2000,       'kankuru hat')
shopModule:addBuyableItem({'leaft jounin protector'},                   7427, 50000,       'leaft jounin protector')

npcHandler:addModule(FocusModule:new())