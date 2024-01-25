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
    if not getPlayerSaga(cid, 1,1) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Olá " .. getCreatureName(cid) .. ", ouvi dizer que nao esta muito bem na academia..queres alguma ajuda \nshinobi?", {"Fechar", "Ajuda"})
    return true
end


if(msgcontains(msg, 'ajuda')) then
-- selfSay('Entao, ouvi falar que tem um {pergaminho} muito poderoso, acredito que se conseguir ele podera aprender qualquer jutsu.', cid)
 sendNpcDialog(cid, getNpcCid(), "Entao, ouvi falar que tem um pergaminho muito poderoso, acredito que se \nconseguir ele podera aprender qualquer jutsu.", {"Fechar", "Pergaminho"})
end
---------------------------------------------------------
if(msgcontains(msg, 'pergaminho')) then
-- selfSay('Entao quer mesmo aprender todos os jutsus? muito bom, ouvi falar que que no predio do hokage tem um bau, e nele existe um pergaminho, pegue o pergaminho e me encontre na {floresta}', cid)
 sendNpcDialog(cid, getNpcCid(), "Então quer mesmo aprender todos os jutsus? muito bom, ouvi falar que que no \npredio do hokage tem um bau, e nele existe um pergaminho, pegue o pergaminho e \nme encontre na floresta", {"Fechar", "Floresta"})
talkState[talkUser] = 1
elseif(msgcontains(msg, 'floresta') and talkState[talkUser] == 1) then
-- selfSay('Exato, saia de konoha e va caminhando para west encontrara na entrada da floresta perdida duas rochas, depois segue o caminho e ira me achar la, vou te ensinar a ler o pergaminho la.', cid)
 sendNpcDialog(cid, getNpcCid(), "Exato,pegue o PERGAMINHO e saia de konoha pelo sul e vá caminhando para west \nencontrara na entrada da floresta perdida duas rochas, depois segue o caminho \ne ira me achar la, vou te ensinar a ler o pergaminho la.", {"Fechar"})
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
return true
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())