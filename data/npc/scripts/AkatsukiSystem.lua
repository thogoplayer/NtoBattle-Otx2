-- Script Akatsuki System Advance 1.0 --
-- By RigBy --
-- tibiaking.com --
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
local level = 350 -- Level preciso pra entra para akatsuki
local itemid = 5943 -- id do coração
local quantidade = 6 -- quantos hearts e preciso
local bonushp = 4000 -- quanto de bonus de life vai ganha
local bonusmp = 4000 -- quanto de bonus de mana vai ganha
local experience = 1.1 -- Experience rates no caso 2x a experiencia do seu servidor.
local config = {
--[Vocation] = ( Nova Vocation, New Outfit )
--[Vocation] = ( Nova Vocation, New Outfit )
[1] = { 1, 527},         --naruto      ok
[70] = { 70, 512},       --neji	    ok
[25] = { 25, 521},         -- lee       ok
[130] = { 130, 535},      --hinata      ok
[170] = { 170, 533},      --itachi     ok
[190] = { 190, 508},      --bee  		ok
[200] = { 200, 703},      --kakashi     ok
[400] = { 400, 525},     --obito       ok
[209] = { 209, 529},     --madara      ok
[300] = { 300, 531},     --minato	    ok
[530] = { 530, 524},     --orochimaru  ok
[631] = { 631, 514},     --deidara     ok
[700] = { 700, 511},     --tobirama    ok
[800] = { 800, 516},     --shisui      ok
[439] = { 439, 530},     --hashirama   ok
[467] = { 467, 532},     --sai         ok
[767] = { 767, 534},     --guren       ok
[633] = { 633, 536},     --sasori      ok
[447] = { 447, 853},     --haku      ok
[13] = { 13, 493},     --sasuke      ok
[353] = { 353, 854},     --onoki      ok
[157] = { 157, 526},     --suigetsu      ok
[139] = { 139, 528},     --ino      ok
[50] = { 50, 570},     --gaara      ok
[305] = { 305, 513},     --jyraia      ok
[192] = { 192, 593},     --tsunade      ok
[145] = { 145, 526},     --suigetsu      ok
[152] = { 152, 492},     --hidan      ok
[172] = { 172, 896},     --danzou      ok
[223] = { 223, 507},     --kankuro      ok
[133] = { 133, 487},     --guy      ok
[520] = { 520, 518},     --raikage      ok
[110] = { 110, 950},     --shikamaru      ok
}
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
 return false
end
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
 
if msgcontains(msg, 'akatsuki') then
    if getPlayerVocation(cid) ~= config then
        if getPlayerStorageValue(cid, 89745) == 5 then
		  if getPlayerStorageValue(cid, 40000) >= 63 then
            if getPlayerLevel(cid) >= level then
                selfSay('Para ser da Membro da Akatsuki, voce tera que matar alguns Shinobi, ate mesmo seus amigos. Tem certeza que quer ser da Akatsuki ?', cid)
                talkState[talkUser] = 1
            else
                selfSay('Voce nem sabe o nivel que e pra entrar na akatsuki, suma da minha frente seu idiota.', cid)
            end
			else
                selfSay('Voce precisa completar as SAGAS.', cid)
            end
        else
            selfSay('Voce precisa ser Sannin para virar Akatsuki', cid)
        end
    else
        selfSay('Nao preciso de voce agora!', cid)
    end
end
 
if talkState[talkUser] == 1 and msgcontains(msg, 'yes') then
    selfSay('acha que e tao simples ? Para ser da Akatsuki voce tera que me trazer '..quantidade..' {coracao} para provar que merece ser da Akatsuki.', cid)
    talkState[talkUser] = 2
end
 
if talkState[talkUser] == 2 and msgcontains(msg, 'coracao') then
    if getPlayerItemCount(cid, 5943) >= quantidade then
    local voc = config[getPlayerVocation(cid)]
        doPlayerSetVocation(cid, voc[1])
    local outfit = {lookType = voc[2]}
        doCreatureChangeOutfit(cid, outfit)
		doPlayerLearnInstantSpell(cid, "Akatsuki Mode")
        setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+bonushp)
        setCreatureMaxMana(cid, getCreatureMaxMana(cid)+bonusmp)
        doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
        doPlayerRemoveItem(cid, 5943, quantidade)
        doCreatureAddMana(cid, getCreatureMaxMana(cid))
        setPlayerStorageValue(cid,89745,6)
        doPlayerSetExperienceRate(cid, experience) 
        selfSay('Parabens agora voce faz parte da Akatsuki.', cid)
        talkState[talkUser] = 0
    else
        selfSay('Nao adianta me enganar, voce nao tem '..quantidade..' coracoes, vai atrás, e so volte com eles.', cid)
    end
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())