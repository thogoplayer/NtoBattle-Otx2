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
if(msgcontains(msg, 'meee')) then
selfSay('A samehada sempre fica em sua forma selada, geralmente ela so e liberada quando ela reconhece que seu dono e forte o suficiente, posso lhe ajudar a {liberar} ela se trouxe-la ate min juntamente com 1000 Great Chakra Potion.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'liberar')) then
selfSay('Ja esta com a samehada e os 1000 de chakra? {sim}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
if(doPlayerRemoveItem(cid, 12294, 1) == TRUE) and (doPlayerRemoveItem(cid, 10365, 1000) == TRUE) then
doPlayerAddItem(cid,3967,1)
selfSay('muito bem, parabéns por conseguir liberar a samehada, mas espera... como que voce conseguiu uma samehada mesmo?...', cid)
else
selfSay('Se nao possui a samehada e nem chakra suficiente para ela como que quer liberar?', cid)
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())