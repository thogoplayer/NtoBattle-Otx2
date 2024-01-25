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


if msgcontains(msg, "presentes") or msgcontains(msg, "presente") then
npcHandler:say("Traga alguns candy canes para min que iremos lhe presentear:\n-{green present} por 100 candy.\n-{red present} por 250 candy.\n-{blue present} por 650 candy.\n-{danzou vocation} por 2000 candy.\n-{crystal enchantament} por 350 candy.", cid)
end

--------------------------green present--------------------------------
if msgcontains(msg, "green present") or msgcontains(msg, "green") then
npcHandler:say("Quer mesmo um green present? {yes} or {no}.", cid)
talkState[talkUser] = 1

elseif msgcontains(msg, "no") and talkState[talkUser] == 1 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
if doPlayerRemoveItem(cid, 2688, 100) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 2326, 1)
else
npcHandler:say("Voce nao tem {Candy} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------green present--------------------------------
if msgcontains(msg, "red present") or msgcontains(msg, "red") then
npcHandler:say("Quer mesmo um red present? {yes} or {no}.", cid)
talkState[talkUser] = 2

elseif msgcontains(msg, "no") and talkState[talkUser] == 2 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 2 then
if doPlayerRemoveItem(cid, 2688, 250) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 2123, 1)
else
npcHandler:say("Voce nao tem {Candy} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------blue present--------------------------------
if msgcontains(msg, "blue present") or msgcontains(msg, "blue") then
npcHandler:say("Quer mesmo um blue present? {yes} or {no}.", cid)
talkState[talkUser] = 3

elseif msgcontains(msg, "no") and talkState[talkUser] == 3 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 3 then
if doPlayerRemoveItem(cid, 2688, 650) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 2445, 1)
else
npcHandler:say("Voce nao tem {Candy} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------danzou--------------------------------
if msgcontains(msg, "danzou vocation") or msgcontains(msg, "danzou") then
npcHandler:say("Quer mesmo um danzou? {yes} or {no}.", cid)
talkState[talkUser] = 4

elseif msgcontains(msg, "no") and talkState[talkUser] == 4 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 4 then
if doPlayerRemoveItem(cid, 2688, 2000) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 11127, 1)
else
npcHandler:say("Voce nao tem {Candy} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------danzou--------------------------------
if msgcontains(msg, "crystal enchantament") or msgcontains(msg, "crystal") then
npcHandler:say("Quer mesmo um crystal? {yes} or {no}.", cid)
talkState[talkUser] = 5

elseif msgcontains(msg, "no") and talkState[talkUser] == 5 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 5 then
if doPlayerRemoveItem(cid, 2688, 350) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 5921, 1)
else
npcHandler:say("Voce nao tem {Candy} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end




end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())