
-- Caixa de Dialogos --
local dialogOpcode_show = 225 -- opcode da janela de dialogos (1)
local dialogOpcode_hide = 226 -- opcode da janela de dialogos (2)
local dialogOpcode_registerBtns = 227 -- opcode da janeal de diaologos (3)

function sendOpenNpcDialog(cid, npcId, text)
	if not isCreature(cid) then
		return true
	end
	
	doSendPlayerExtendedOpcode(cid, dialogOpcode_show, getCreatureName(npcId).."@"..getCreatureOutfit(npcId).lookType.."@"..text.."@")
	return true
end

function sendCloseNpcDialog(cid)
	if not isCreature(cid) then
		return true
	end
	
	doSendPlayerExtendedOpcode(cid, dialogOpcode_hide, "fechar".."@")
	return true
end

function sendNpcDialogButtons(cid, buttons)
	if not isCreature(cid) then
		return true
	end
	
	for i = 1, #buttons do
		doSendPlayerExtendedOpcode(cid, dialogOpcode_registerBtns, buttons[i].."@")
	end
	return true
end

function sendNpcDialog(cid, npcId, text, buttons)
	if not isCreature(cid) then
		return true
	end
	
	if not isNpc(npcId) then
		return true
	end
	
	sendCloseNpcDialog(cid)
	sendOpenNpcDialog(cid, npcId, text)
	sendNpcDialogButtons(cid, buttons)
	return true
end