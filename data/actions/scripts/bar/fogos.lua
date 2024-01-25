--[[Script By Vodkart]]--

function onUse(cid, item, fromPosition, itemEx, toPosition)

local config = {
pz = true, -- players precisam estar em protection zone para usar? (true or false)
battle = true, -- players deve estar sem battle (true or false)
checkstorage = true, -- se os teleport irão precisar de level (true or false)
premium = false -- se precisa ser premium account (true or false)
}

--[[ Config lugares]]--
local lugar = {

[6541] = { -- Id do item
storage = 7128140, name = "Fogos"},
[6539] = { -- Id do item
storage = 7128141, name = "Escuro"},
[6543] = { -- Id do item
storage = 7128142, name = "Rainbow"},
[6542] = { -- Id do item
storage = 7128143, name = "Ghost"},
[6540] = { -- Id do item
storage = 7128144, name = "Bow"},
}

--[[ Lista de Viagem (Não mexa) ]]--



local a = lugar[item.itemid]
if not(a) then
doPlayerSendTextMessage(cid, 22, "desculpe,digite uma outfit valida")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
elseif config.pz == false and getTilePzInfo(getCreaturePosition(cid)) == FALSE then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"você precisa estar em protection zone pra poder utilizar sua Bar.")
return TRUE
elseif config.premium == true and not isPremium(cid) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Apenas players com premium account podem usar este item.")
return TRUE
elseif config.battle == true and getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você precisa estar sem battle pra poder usar sua Bar.")
return TRUE
elseif config.checkstorage == true and getPlayerStorageValue(cid, a.storage) >= 1 then
doPlayerSendTextMessage(cid, 22, "Desculpe,mas voce ja tem a Bar "..a.name..".")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
end
setPlayerStorageValue(cid, a.storage, 1)
doSendMagicEffect(getCreaturePosition(cid),5)
doRemoveItem(item.uid, 1)
doPlayerSendTextMessage(cid, 22, "Voce adquiriu a healthbar: " ..a.name.. ".")
return TRUE
end