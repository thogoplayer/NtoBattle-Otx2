local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local shopWindow = {}
local moeda = 13893 -- ID DA MOEDA
local t = {
          [18461] = {price = 50}, -- [ID DO ITEM QUE SERÁ VENDIDO] = {QUANTO IRÁ CUSTAR}
		  [18464] = {price = 50},
		  [18467] = {price = 50},
		  [18470] = {price = 50},
		  [18473] = {price = 50},
		  [18476] = {price = 50},
		  [18479] = {price = 50},
		  [18482] = {price = 50},
		  [18485] = {price = 50},
          }
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
        if  t[item] and not doPlayerRemoveItem(cid, moeda, t[item].price) then
                  selfSay("você não tem "..t[item].price.." "..getItemNameById(moeda), cid)
                         else
                doPlayerAddItem(cid, item)
                selfSay("aqui está seu item!", cid)
           end
        return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
                        for var, ret in pairs(t) do
                                        table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
                                end
                        openShopWindow(cid, shopWindow, onBuy, onSell)
                end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())