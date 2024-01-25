-- Script por Killua, antigo Amoeba13 --

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

    if killuaTask[msg] then
        if getPlayerTableStorage(cid, killuaTask[msg].storage).done == -1 or getPlayerTableStorage(cid, killuaTask[msg].storage).done == nil then
            if getPlayerTableStorage(cid, killuaTask[msg].storage).count == killuaTask[msg].count then
                local esperiencia = killuaTask[msg].exp > 0 and killuaTask[msg].exp.." exp, " or ""
                local dineiro = killuaTask[msg].money > 0 and killuaTask[msg].money.." gold coins e " or ""
                selfSay("Você conseguiu completar a task de ".. msg .. ", parabéns! Eu vou te dar " .. esperiencia .. "" .. dineiro .."alguns itens como recompensa.", cid)
                doPlayerAddExperience(cid, killuaTask[msg].exp)
                doPlayerAddMoney(cid, killuaTask[msg].money)
                setPlayerTableStorage(cid, killuaTask[msg].storage, {["done"] = 1, ["count"] = getPlayerTableStorage(cid, killuaTask[msg].storage).count})
                for juba, prize in pairs(killuaTask[msg].premios) do
                    doPlayerAddItem(cid, prize[1], prize[2])
                end
            else
				local kont = getPlayerTableStorage(cid, killuaTask[msg].storage).count ~= nil and getPlayerTableStorage(cid, killuaTask[msg].storage).count or 0
                selfSay("Desculpe, mas você ainda não matou todos os " .. msg .. "s. Voce só matou "..kont.." de " .. killuaTask[msg].count .. " " .. msg .. "s.", cid)
            end
        else
            selfSay("Você só pode recber uma vez o prêmio de cada task.", cid)
        end
    else
        selfSay("Essa task não existe! Não quero saber de conversa, só me diga o nome da task.", cid)
    end
    return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())