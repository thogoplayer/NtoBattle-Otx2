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
          [18149] = {price = 1}, -- [ID DO ITEM QUE SERÁ VENDIDO] = {QUANTO IRÁ CUSTAR}

          }
local onSell = function(cid, item, subType, amount)
    if getPlayerItemCount(cid, item) >= amount then
    doPlayerRemoveItem(cid, item, amount)
    doPlayerAddItem(cid, moeda,t[item].price*amount)
    selfSay("aqui esta seu dinheiro!", cid)
    else
    selfSay("voce nao tem "..getItemNameById(item), cid)
    end
return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
                        for var, ret in pairs(t) do
                                        table.insert(shopWindow, {id = var, subType = 0, buy = 0, sell = ret.price, name = getItemNameById(var)})
                                end
                        openShopWindow(cid, shopWindow, onBuy, onSell)
                end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())