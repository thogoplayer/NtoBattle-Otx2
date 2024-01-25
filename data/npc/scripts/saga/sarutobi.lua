local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end


function onCreatureSay(cid, type, msg)
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if msgcontains(msg, "hi") then
    sendNpcDialog(cid, getNpcCid(), "Muito bom  " .. getCreatureName(cid) .. ", hoje ele mostrou todo o seu potencial na arena, você tem um \nfuturo brilhante.", {"Fechar", "Shinobi"})
    return true
end


local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'shinobi')) then
-- selfSay('Ohh sim ... sério, a partir de agora você vai se chamar {chunin}, eu gosto muito desse espírito jovem, eu me lembro da minha juventude.', cid)
sendNpcDialog(cid, getNpcCid(), "Ohh sim ... sério, a partir de agora você vai se chamar {chunin}, eu gosto \nmuito desse espírito jovem, eu me lembro da minha juventude.", {"Fechar", "Chunin"})
end
---------------------------------------------------------
if(msgcontains(msg, 'chunin')) then
-- selfSay('Ok então, sem mais delongas me dê o certificado da conclusão do exame, pois estará nos seus arquivos ninjas que você concluiu o exame chunin!', cid)
sendNpcDialog(cid, getNpcCid(), "Ok então, sem mais delongas me dê o certificado da conclusão do exame, pois \nestará nos seus arquivos ninjas que você concluiu o exame chunin!", {"Fechar", "Certificado"})
talkState[talkUser] = 1
elseif(msgcontains(msg, 'certificado', 'certificate', 'certificate') and talkState[talkUser] == 1) then
if(doPlayerRemoveItem(cid, 6087, 1) == true) then
doPlayerAddExperience(cid,25000)
doPlayerNextSaga(cid)
doTeleportThing(cid, {x= 1965, y=2025, z= 7})
-- selfSay('Umm, that gives me more joy and encouragement to live, seeing this youth so determined, you can consider yourself a chunin from now on!', cid)
sendNpcDialog(cid, getNpcCid(), "Hum, isso me dá mais alegria e ânimo para viver, ver esse jovem tão determinado, pode se considerar um chunin a partir de agora!", {"Fechar"})
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
else
-- selfSay('Cade o certificado Shinobi, sem ele você não pode ganhar o título Chunin, traga-me o CERTIFICADO!', cid)
sendNpcDialog(cid, getNpcCid(), "Cade o certificado Shinobi, sem ele você não pode ganhar o título Chunin, \ntraga-me o CERTIFICADO!", {"Fechar"})
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())