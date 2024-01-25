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

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


if getStorage(26000) < 1 then
npcHandler:say("Excuse me, out of stock! Sunday at 00:00 I will renew the stock.")
talkState[talkUser] = 0
return false
end

if getPlayerStorageValue(getNpcId(),getPlayerIp(cid)) > 0 then
npcHandler:say("Sorry, seeing only for one person by ip, per day.")
talkState[talkUser] = 0
return false
end


local quantidade = getStorage(26000) ---- quantidade de produtos que restam
local produto = getStorage(26001) -- id do produto escolhido
local preco = getStorage(26002)  --preço do produto
local moeda = getStorage(26003)  ---- id da moeda


if msgcontains(msg, "yes") and not (talkState[talkUser] == 10) then
npcHandler:say("Muito bem! Traga-me apenas "..preco.." "..getItemNameById(moeda).."s para que possa-mos {negociar}.", cid) --sefodeu
talkState[talkUser] = 9
end

--------------------------kisame vocation--------------------------------
if msgcontains(msg, "negociar") and talkState[talkUser] == 9  then
npcHandler:say("Voce tem certeza que deseja trocar "..preco.." "..getItemNameById(moeda).."s por 1 "..getItemNameById(produto).."? {yes} or {no}.", cid) --sefodeu
talkState[talkUser] = 10

elseif msgcontains(msg, "no") and talkState[talkUser] == 10 then
npcHandler:say("Okay, when you decide to talk to me again.", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 10 then
if doPlayerRemoveItem(cid, moeda, preco) == true then

npcHandler:say("Thank you! Here is the purchased item.", cid)
setGlobalStorageValue(26000, quantidade-1)
local item = doPlayerAddItem(cid, produto, 1)
local desc = getItemInfo(produto).description
doItemSetAttribute(item, "description", ""..desc.."\nObtido pelo Mercado Negro")
setPlayerStorageValue(getNpcId(), getPlayerIp(cid), 1)
if quantidade-1 > 0 then
local quant = (quantidade-1 > 1 and "s" or "")
doBroadcastMessage("[Mercado Negro System]\n O jogador "..getCreatureName(cid).." comprou 1 "..getItemNameById(produto).." no Mercado Negro, agora restam apenas "..(quantidade-1).." unidade"..quant..".", 21)
else
doBroadcastMessage("[Mercado Negro System]\n O jogador "..getCreatureName(cid).." comprou a ultima unidade de "..getItemNameById(produto).." no Mercado Negro, o estoque será renovado Domingo às 00:00.", 21)
end
local file = "data/logs/Mercado Negro.txt"
local text = io.open(file, "a+")
text:write("["..os.date("%d/%m/%Y %X", os.time()).."] "..getPlayerName(cid).." ["..getPlayerLevel(cid).."]: Comprou 1 "..getItemNameById(produto).." por "..preco.." "..getItemNameById(moeda).."s.\n")
text:close()
talkState[talkUser] = 0

else
npcHandler:say("Você não tem "..getItemNameById(moeda).."s suficientes! ", cid)
talkState[talkUser] = 0
end
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())