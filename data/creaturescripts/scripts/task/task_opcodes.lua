local taskOPCODE_sendINFOS = 67 -- opcode que vai enviar para o servidor sinalizando que precisa enviar as informacoes de volta pro cliente
local taskOPCODE_changeRANK = 68 -- opcode que vai enviar para o servidor sinalizando que ele tem que trocar a categoria do ranking
local taskOPCODE_acceptTASK = 69 -- opcode que vai enviar para o servidor sinalizando que ele tem que aceitar a task X
local taskOPCODE_collectTASK = 70 -- opcode que vai enviar para o servidor sinalizando que ele tem que recolher o premio da task
local taskOPCODE_cancelTASK = 71 -- opcode que vai enviar para o servidor sinalizando que ele tem que cancelar a task

function onExtendedOpcode(cid, opcode, buffer)
   if opcode == taskOPCODE_sendINFOS then
      sendTaskWindow(cid, "E")
   end

   if opcode == taskOPCODE_changeRANK then
      local param = buffer:explode("@")
      local rank = tostring(param[1])
      sendTaskWindow(cid, rank)
   end

   if opcode == taskOPCODE_acceptTASK then
      local param = buffer:explode("@")
      local taskindex = tonumber(param[1])
      local rank = tostring(param[2])

      doAcceptTask(cid, taskindex, rank)
   end

   if opcode == taskOPCODE_collectTASK then
      local param = buffer:explode("@")
      local taskindex = tonumber(param[1])
      local rank = tostring(param[2])

      doCollectTaskRecompense(cid, taskindex, rank)
   end

   if opcode == taskOPCODE_cancelTASK then
      local param = buffer:explode("@")
      local taskindex = tonumber(param[1])
      local rank = tostring(param[2])

      doCancelTask(cid, taskindex, rank)
   end
   return true
end