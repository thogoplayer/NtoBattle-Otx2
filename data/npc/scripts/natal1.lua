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


if msgcontains(msg, "items") or msgcontains(msg, "item") then
npcHandler:say("posso lhe recompensar com estes items:\n-{kakuzu heart} por 30 doll.\n-{noel hat} por 30 doll.\n-{necklace of uchiha} por 25 doll.\n-{aburame necklace} por 25 doll.\n-{hokage necklace} por 25 doll.\n- 100{divine potion} por 4 doll.\n- 100{demonic potion} por 4 doll.\n-{chakra shield} por 20 doll.\n-{gold token} por 7 doll.\n-{golden ticket} por 5 doll.\n-{noel backpack} por 40 doll.", cid)
end

--------------------------green present--------------------------------
if msgcontains(msg, "kakuzu heart") or msgcontains(msg, "kakuzu") then
npcHandler:say("Quer mesmo um kakuzu heart? {yes} or {no}.", cid)
talkState[talkUser] = 1

elseif msgcontains(msg, "no") and talkState[talkUser] == 1 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
if doPlayerRemoveItem(cid, 6512, 30) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 11124, 1)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------green present--------------------------------
if msgcontains(msg, "noel hat") or msgcontains(msg, "hat") then
npcHandler:say("Quer mesmo um noel hat? {yes} or {no}.", cid)
talkState[talkUser] = 2

elseif msgcontains(msg, "no") and talkState[talkUser] == 2 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 2 then
if doPlayerRemoveItem(cid, 6512, 30) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 12393, 1)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------blue present--------------------------------
if msgcontains(msg, "uchiha of necklace") or msgcontains(msg, "uchiha") then
npcHandler:say("Quer mesmo um uchiha of necklace? {yes} or {no}.", cid)
talkState[talkUser] = 3

elseif msgcontains(msg, "no") and talkState[talkUser] == 3 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 3 then
if doPlayerRemoveItem(cid, 6512, 25) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 15770, 1)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------danzou--------------------------------
if msgcontains(msg, "aburame necklace") or msgcontains(msg, "aburame") then
npcHandler:say("Quer mesmo um aburame necklace? {yes} or {no}.", cid)
talkState[talkUser] = 4

elseif msgcontains(msg, "no") and talkState[talkUser] == 4 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 4 then
if doPlayerRemoveItem(cid, 6512, 25) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 15489, 1)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------danzou--------------------------------
if msgcontains(msg, "hokage necklace") or msgcontains(msg, "hokage") then
npcHandler:say("Quer mesmo um hokage necklace? {yes} or {no}.", cid)
talkState[talkUser] = 5

elseif msgcontains(msg, "no") and talkState[talkUser] == 5 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 5 then
if doPlayerRemoveItem(cid, 6512, 25) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 15790, 1)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------danzou--------------------------------
if msgcontains(msg, "divine potion") or msgcontains(msg, "divine") then
npcHandler:say("Quer mesmo 100 divine potion? {yes} or {no}.", cid)
talkState[talkUser] = 6

elseif msgcontains(msg, "no") and talkState[talkUser] == 6 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 6 then
if doPlayerRemoveItem(cid, 6512, 4) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 14258, 100)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------danzou--------------------------------
if msgcontains(msg, "demonic potion") or msgcontains(msg, "demonic") then
npcHandler:say("Quer mesmo 100 demonic potion? {yes} or {no}.", cid)
talkState[talkUser] = 7

elseif msgcontains(msg, "no") and talkState[talkUser] == 7 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 7 then
if doPlayerRemoveItem(cid, 6512, 4) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 14259, 100)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------danzou--------------------------------
if msgcontains(msg, "chakra shield") or msgcontains(msg, "shield") then
npcHandler:say("Quer mesmo um chakra shield? {yes} or {no}.", cid)
talkState[talkUser] = 8

elseif msgcontains(msg, "no") and talkState[talkUser] == 8 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 8 then
if doPlayerRemoveItem(cid, 6512, 20) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 7428, 1)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------danzou--------------------------------
if msgcontains(msg, "gold token") or msgcontains(msg, "token") then
npcHandler:say("Quer mesmo um gold token? {yes} or {no}.", cid)
talkState[talkUser] = 9

elseif msgcontains(msg, "no") and talkState[talkUser] == 9 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 9 then
if doPlayerRemoveItem(cid, 6512, 7) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 18320, 1)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------danzou--------------------------------
if msgcontains(msg, "golden ticket") or msgcontains(msg, "ticket") then
npcHandler:say("Quer mesmo um golden ticket? {yes} or {no}.", cid)
talkState[talkUser] = 10

elseif msgcontains(msg, "no") and talkState[talkUser] == 10 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 10 then
if doPlayerRemoveItem(cid, 6512, 5) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 18487, 1)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end
--------------------------danzou--------------------------------
if msgcontains(msg, "noel backpack") or msgcontains(msg, "backpack") then
npcHandler:say("Quer mesmo um noel backpack? {yes} or {no}.", cid)
talkState[talkUser] = 11

elseif msgcontains(msg, "no") and talkState[talkUser] == 11 then
npcHandler:say("Voce quem sabe...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 11 then
if doPlayerRemoveItem(cid, 6512, 40) == TRUE then
npcHandler:say("Aqui esta garoto,{Feliz Natal).", cid)
doPlayerAddItem(cid, 14372, 1)
else
npcHandler:say("Voce nao tem {Santa Doll} suficientes, para adquirir mais pegue alguns duendes", cid)
end
end




end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())