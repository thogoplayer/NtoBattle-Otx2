local function split(str, length)
   local lines = {}
   
   if str:len( ) > length then
	while str:len( ) > 0 do
		local s = string.sub( str, 1, length )
		table.insert( lines, s )
		str = string.sub( str, length + 1 )
	end
   else
	   table.insert(lines, str )
	   return lines   
   end
   return lines
end

function sendMessageToClient( cid, message )
	local msg = message
	if msg:len() > 400 then
		local strs    = split( msg, 400 )
		strs[ 1 ]     = '$BeginMsgFromServer' .. strs[ 1 ]
		strs[ #strs ] = strs[ #strs ] .. '$EndMsgFromServer'
		
		for _,str in ipairs( strs ) do
			doPlayerSendTextMessage( cid, MESSAGE_INFO_DESCR, str )
		end

	else
		msg = '$OneLineMsgFromServer' .. message
		doPlayerSendTextMessage( cid, MESSAGE_INFO_DESCR, msg )
	
	end
end

function addMsgValue( msg, value )
	return msg .. '@' .. value
end

--manda os attacks para o client
function sendAttacksToClient( cid, attacks )

	--attacks é uma tabela com os attacks que devem ser enviados. o maximo é 18 attacks
	
	local msg = ""
		
	msg = addMsgValue( msg, "$Attacks" )
	
for _,attack in ipairs( attacks ) do
	if getPlayerLearnedInstantSpell(cid, attack.name) == true then
		msg = addMsgValue( msg, attack.icon ) --id do icone no dat
		msg = addMsgValue( msg, attack.icon ) --id do icone no dat quando o attack tiver em cooldown
		msg = addMsgValue( msg, attack.name ) --nome do attack, é isso que o player vai falar pra usar a magia e esse nome que vai usar pra mandar o cooldown
	end
	end
	
	msg = addMsgValue( msg, "$$" )
	
	sendMessageToClient( cid, msg )
	-- print(msg)
	return true
end

-- manda um attack ficar em cooldown

function sendAttackCooldownToClient( cid, attackName, cooldown )
	local msg = ""
	
	msg = addMsgValue( msg, "$Cooldown" )
	msg = addMsgValue( msg, attackName ) --nome do attack pra dar cooldown
	msg = addMsgValue( msg, cooldown ) -- tempo do cooldown
	
	sendMessageToClient( cid, msg )
end

function sendCooldownColorToClient( cid, r, g, b )
	local msg = ""
	
	msg = addMsgValue( msg, "$CooldownColor" )
	msg = addMsgValue( msg, r ) 
	msg = addMsgValue( msg, g )
	msg = addMsgValue( msg, b )
	
	sendMessageToClient( cid, msg )
end

-- manda uma janela com 2 escolhas

function sendChooseWindowToClient( cid, title, text, yesText, yesTalk, noText, noTalk )
	local msg = ""
	
	msg = addMsgValue( msg, "$SelectWindow" )
	msg = addMsgValue( msg, title )
	msg = addMsgValue( msg, text )
	msg = addMsgValue( msg, yesText )
	msg = addMsgValue( msg, yesTalk )
	msg = addMsgValue( msg, noText )
	msg = addMsgValue( msg, noTalk )
	
	sendMessageToClient( cid, msg )
end



function sendPopupIconWindow(cid, icon, title, text)
	local msg = ""
	
	msg = addMsgValue(msg, "$PopupIconWindow")
	msg = addMsgValue(msg, title)
	msg = addMsgValue(msg, text)
	msg = addMsgValue(msg, icon)
	
	sendMessageToClient(cid, msg)
end
	
-- 204 = Vermelho
-- 10027008 = Azul
-- 16777215 = Branco
-- doPlayerSendTextMessage( cid, MESSAGE_INFO_DESCR, "$OneLineMsgFromServer@$MonstersColorsData@2@Ancient Dinosaur@16711680@Mummy@16711680")

	
function sendMonstersNameColors(cid, data)
	local msg = ""
	
	msg = addMsgValue(msg, "$MonstersColorsData")
	msg = addMsgValue(msg, #data)
	
	for _, info in ipairs(data) do
		msg = addMsgValue(msg, info.name)
		msg = addMsgValue(msg, info.color)
	end
	-- print(msg)
	sendMessageToClient(cid, msg)
end




