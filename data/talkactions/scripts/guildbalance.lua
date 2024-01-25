local function isValidMoney(value)
    if(value == nil) then
        return false
    end
    return (value > 0 and value <= 99999999999999)
end
 
function onSay(cid, words, param, channel)
if getPlayerStorageValue(cid, 567367323) < 1 then
		setPlayerStorageValue(cid, 567367323, 0)
		end
		if getPlayerStorageValue(cid, 567367324) < 1 then
		setPlayerStorageValue(cid, 567367324, 0)
		end
    local guild = getPlayerGuildId(cid)
    if(guild == 0) then
        return false
    end
 
    local t = string.explode(param, ' ', 1)
		if (getPlayerGuildLevel(cid) < GUILDLEVEL_LEADER and isInArray({ 'saque' }, t[1])) then
	    doPlayerSendChannelMessage(cid, '', 'Apenas Lideres podem fazer um saque.', TALKTYPE_CHANNEL_W, 0)
		end
    if (getPlayerGuildLevel(cid) == GUILDLEVEL_LEADER and isInArray({ 'saque' }, t[1])) then
	if(t[1] == 'saque') then
	if not (tonumber(t[2])) then
  doPlayerSendChannelMessage(cid, '', 'Digite o valor a ser saquado.', TALKTYPE_CHANNEL_W, 0)
 return true
 end
            local money = { tonumber(t[2])*10000 }
            if(not isValidMoney(money[1])) then
                doPlayerSendChannelMessage(cid, '', 'Quantidade de dinheiro inválida.', TALKTYPE_CHANNEL_W, 0)
                return true
            end
	
 
            local result = db.getResult('SELECT `balance` FROM `guilds` WHERE `id` = ' .. guild)
            if(result:getID() == -1) then
                return false
            end
 
            money[2] = result:getDataLong('balance')
            result:free()
 
            if(money[1] > money[2]) then
                doPlayerSendChannelMessage(cid, '', 'O saldo é muito baixo para esse valor.', TALKTYPE_CHANNEL_W, 0)
                return true
            end
 
            if(not db.query('UPDATE `guilds` SET `balance` = `balance` - ' .. money[1] .. ' WHERE `id` = ' .. guild .. ' LIMIT 1;')) then
                return false
            end
		setPlayerStorageValue(cid, 567367323, getPlayerStorageValue(cid, 567367323)+(tonumber(t[2])))
            doPlayerAddMoney(cid, money[1])
            doPlayerSendChannelMessage(cid, '', 'Voce só pegou ' .. (money[1]/10000) .. ' gold bars do saldo de sua guild.', TALKTYPE_CHANNEL_W, 0)
        else
           doPlayerSendChannelMessage(cid, '', 'Sub-Comando inválido.', TALKTYPE_CHANNEL_W, 0)
        end
    elseif(t[1] == 'doar') then
	if not (tonumber(t[2])) then
  doPlayerSendChannelMessage(cid, '', 'Digite o valor a ser doado.', TALKTYPE_CHANNEL_W, 0)
 return true
 end
        local money = tonumber(t[2])*10000
        if(not isValidMoney(money)) then
            doPlayerSendChannelMessage(cid, '', 'Quantidade de dinheiro inválida.', TALKTYPE_CHANNEL_W, 0)
            return true
        end
        if money < 10000 then
		doPlayerSendChannelMessage(cid, '', 'Valor Minimo é de 1 Gold Bar', TALKTYPE_CHANNEL_W, 0)
            return true
        end
        if(getPlayerMoney(cid) < money) then
            doPlayerSendChannelMessage(cid, '', 'Voce não tem dinheiro suficiente.', TALKTYPE_CHANNEL_W, 0)
            return true
        end
 
        if(not doPlayerRemoveMoney(cid, money)) then
         return false
         end
         db.query('UPDATE `guilds` SET `balance` = `balance` + ' .. money .. ' WHERE `id` = ' .. guild .. ' LIMIT 1;')
        doPlayerSendChannelMessage(cid, '', 'Voce transferiu ' .. (money/10000) .. ' gold bars para a sua guild.', TALKTYPE_CHANNEL_W, 0)
		setPlayerStorageValue(cid, 567367324, getPlayerStorageValue(cid, 567367324)+(tonumber(t[2])))
    else
        local result = db.getResult('SELECT `name`, `balance` FROM `guilds` WHERE `id` = ' .. guild)
        if(result:getID() == -1) then
            return false
        end
        doPlayerSendChannelMessage(cid, '', 'O saldo atual da guild ' .. result:getDataString('name') .. ' é: ' .. (result:getDataLong('balance')/10000) .. ' Gold Bars.', TALKTYPE_CHANNEL_W, 0)
		doPlayerSendChannelMessage(cid, '', 'Seu saldo total de doaçoes para a guild foi de '..getPlayerStorageValue(cid, 567367324)..' Gold Bars.', TALKTYPE_CHANNEL_W, 0)
		if getPlayerGuildLevel(cid) == GUILDLEVEL_LEADER then
		doPlayerSendChannelMessage(cid, '', 'Seu saldo total de saques feitos na guild foi de '..getPlayerStorageValue(cid, 567367323)..' Gold Bars.', TALKTYPE_CHANNEL_W, 0)
		end
        result:free()
	end
    return true
end