function onSay(cid, words, param, channel)

local t = string.explode(param, ",")

if param == '' or not days or not name or not motivo then doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite /ban nome,dias,motivo.") return true end

local name, days = t[1], tonumber(t[2])

local motivo = t[3]

local acc = getAccountIdByName(name)

if acc ~= 0 then

local tempo = days * 24 * 3600

doAddAccountBanishment(acc, target, os.time() + tempo, 5, 2, 'Você foi banido por "..motivo..",por "..tempo.." !.', 0)

doBroadcastMessage("O jogador ".. getCreatureName(target).. " foi banido por ".. getCreatureName(cid).. ". Motivo:\n".. motivo .. ".", 25)

addEvent(doRemoveCreature, 3*1000, target, true)

return true

end
end