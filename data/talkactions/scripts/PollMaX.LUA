--[[
	Poll System
	Author: Maxwell Denisson(MaXwEllDeN)
	Version: 1.0
]]


function onSay(cid, words, param)
   local funcs = {"add", "result", "finalize", "list", "vote"}		  
  
   local POLL = _POLL_SYS
  
   if not(POLL.on) then
	  return false
   end
  
   local paramCHECK = param:lower()
   local param = param:lower()
   local params = string.explode(param, ";")
   local param = params[1]	
  
   local helpE = "Poll System Help: \n \n * vote - serve para votar em uma enquete. \n"
   local helpE = helpE .."	 Exemplo de uso: " .. words .. " vote; enquete; op��o " .. words .. " vote; Qual melhor narutibia?; Ntoshinobi\n"
   local helpE = helpE .."\n * list - lista as enquetes existentes. \n"
   local helpE = helpE .."	 Exemplo de uso: " .. words .. " list"			

   if (getPlayerAccess(cid) >= 4) then
	  helpE = helpE .. "\n\n * add - serve para adicionar uma enquete. \n	 Exemplo de uso: " .. words .. " add; Voc� votaria no sim?; {'N�o', 'Sim'}\n"
	  helpE = helpE .. "\nVoc� votaria no sim? � a enquete, o que estiver dentro de {} s�o as op��es, ATEN��O: TODAS OP��ES DEVEM SER FEITAS DENTRO DE \'\', E SEPARADAS POR VIRGULA!"
	  helpE = helpE .. "\n\n * finalize - serve para finalizar uma enquete. \n	 Exemplo de uso: ".. words .. " finalize; Voc� votaria no sim?\n\nVoc� votaria no sim � a enquete que voc� deseja finalizar."
   end
				  
   if not(isInArray(funcs, param)) then
	  return doShowTextDialog(cid, 1953, helpE)
   end

   if (param == "add") and (getPlayerAccess(cid) >= 4) then
	  
	  if not(params[3]) then  
		 return doShowTextDialog(cid, 1953, helpE)
	  end	
	
	  local optionS = loadstring("return " .. params[3]:lower())()

	  if (type(optionS) ~= "table") then  
		 return doShowTextDialog(cid, 1953, helpE)
	  end
	  
	  local _, paramCHECK = paramCHECK:gsub(";", "a")
	  
	  if (paramCHECK > 2) then					  
		 return doPlayerSendTextMessage(cid, 27, "Voc� n�o pode usar \";\" nas op��es")
	  end
				  
	  if not (optionS[2]) then
		 return doPlayerSendTextMessage(cid, 27, "Sua enquete deve ter no m�nimo 2 op��es")
	  end
	  
	  local Opt = {}
	  for _, b in pairs(optionS) do
		  Opt[b] = 0		  
	  end
	  
	  if (POLL.func.hasPoll(params[2])) then
		 return doPlayerSendTextMessage(cid, 27, "J� existe uma enquete nomeada ".. params[2])
	  end
			
	  POLL.func.addPoll(''..params[2]..'', Opt)	  
	  doPlayerSendTextMessage(cid, 27, "A enquete ".. params[2] .." foi adicionada com as op��es: ".. params[3]:lower() ..".")
   elseif (param == "finalize") and (getPlayerAccess(cid) >= 4) then
	  if not (params[2]) then
		 return doShowTextDialog(cid, 1953, helpE)
	  end		  

	  if not (POLL.func.hasPoll(params[2])) then
		 return doPlayerSendTextMessage(cid, 27, "N�o existe nenhum enquete no banco de dados nomeada ".. params[2] .. "!")
	  end

	  local HValue = POLL.func.getPollHighestValue(params[2])

	  if (HValue == "") then
		 doBroadcastMessage("A enquete " .. params[2] .. " foi finalizada, sem op��es vencedoras!")
	  else
		 doBroadcastMessage("A enquete " .. params[2] .. " foi finalizada, e a op��o que recebeu mais votos foi: ".. HValue ..".")	  
	  end
	  doPlayerSendTextMessage(cid, 27, "A enquete ".. params[2] .." foi finalizada.")
	  POLL.func.removePoll (params[2])
	  POLL.func.removeAllPlayersVote (params[2])		
   elseif (param == "list") then
	  local polls = POLL.func.getPolls()
	  local kizizim = 0
	  mszi = "Poll System:\n\nEnquetes Ativas:\n"
	  local function getPollsOptions(poll)
		 local fukZz = ""
		 for _, b in pairs(polls) do
			if (b[1] == poll:lower()) then
			   for c, _ in pairs(b[2]) do
				  fukZz = fukZz .. "\n		 " .. c
			   end
			   return fukZz
			end
		 end
	  end
	  for a, b in pairs(polls) do
		  kizizim = 1
		  mszi = mszi .. "\n   * ".. b[1] .. getPollsOptions(b[1])		  
	  end																	  
		  mszi = mszi .. "\n~-~-~-~-~-~-~-~-~-~-~-~-~-"
	  if (kizizim == 0) then
		 return doPlayerSendTextMessage(cid, 27, "N�o existe nenhuma enquete no momento!")
	  end

	  doShowTextDialog(cid, 1953, mszi)				
   elseif (param == "vote") then			
	  if not (params[3]) then
		 return doShowTextDialog(cid, 1953, helpE)
	  end		  

	  if not (POLL.func.hasPoll(params[2])) then
		 return doPlayerSendTextMessage(cid, 27, "N�o existe nenhum enquete nomeada \"".. params[2] .. "\"! Para ver a lista das enquetes dispon�veis digite: ".. words .. " list")
	  end

	  if (POLL.func.hasPlayerVote(cid, params[2])) then
		 return doPlayerSendTextMessage(cid, 27, "Voc� j� votou nesta enquete.")
	  end
	  
	  if not(POLL.func.hasPollOption(params[2], params[3])) then
		 return doPlayerSendTextMessage(cid, 27, "A enquete ".. params[2] .. " n�o tem nenhuma op��o nomeada ".. params[3] .. "! Para ver a lista das enquetes e suas op��es dispon�veis digite: ".. words .. " list")
	  end
	  
	  POLL.func.addVote(params[2], params[3], cid)
	  doPlayerSendTextMessage(cid, 27, "Obrigado por participar da enqute ".. params[2] .. ".")
   elseif (param == "result") then
	  local polls = POLL.func.getPolls()
	  local kizizim = 0
	  mszi = "Poll System:\n\nResultado das enquetes:\n"
	  local function getPollsOptions(poll)
		 local fukZz = ""
		 for _, b in pairs(polls) do
			if (b[1] == poll:lower()) then
			   for c, d in pairs(b[2]) do
				  fukZz = fukZz .. "\n		 " .. c .. " - ".. d .. " voto(s)."
			   end
			   return fukZz
			end
		 end
	  end
	  for a, b in pairs(polls) do
		  kizizim = 1
		  mszi = mszi .. "\n   * ".. b[1] .. getPollsOptions(b[1])		  
	  end																	  
		  mszi = mszi .. "\n~-~-~-~-~-~-~-~-~-~-~-~-~"
	  if (kizizim == 0) then
		 return doPlayerSendTextMessage(cid, 27, "N�o existe nenhuma enquete no momento!")
	  end

	  doShowTextDialog(cid, 1953, mszi)
   end		
   return true
end
