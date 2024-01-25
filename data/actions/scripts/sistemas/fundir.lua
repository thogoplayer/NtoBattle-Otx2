local function isEqualItems(bau)
local itemScan = getContainerItem(bau, 0).itemid
    for i = 1, getContainerSize(bau)-1, 1 do
        if itemScan ~= getContainerItem(bau, i).itemid then	
        return false
        end
    end
return true
end


local function fundir(cid, item, name, bau, effect)
local file = "data/logs/FundirSystem.txt"
local text = io.open(file, "a+")
    for i = getContainerSize(bau)-1, 0, -1 do
	doRemoveItem(getContainerItem(bau, i).uid)
    end
    
	local result = item
	for i = 1, #RaridadeTable[name], 1 do
		if item == RaridadeTable[name][i] then
	    result = RaridadeTable[name][i+1]
		end
	end
	
	local sucess = doCreateItemEx(result)
	doAddContainerItemEx(bau, sucess)
	text:write("["..os.date("%d/%m/%Y %X", os.time()).."] "..getPlayerName(cid).." ["..getPlayerLevel(cid).."] criou um "..getItemNameById(result)..".\n")
	text:close()
	doSendMagicEffect(getThingPos(cid), 743)
end 

local function checkContainerBau(cid, pos)
	pos.x = pos.x + 1
    local bau = getTileItemById(pos, 14139).uid
    if bau <= 0 then return false end
	if getContainerSize(bau) ~= 10 then return doPlayerSendTextMessage(cid, 22, "Coloque 10 items iguais para fundir dentro do baú") end
	if not isEqualItems(bau) then return doPlayerSendTextMessage(cid, 22, "Não foi possivel.É necessario ter 10 unidades do item escolhido para fundir") end
	local item = getContainerItem(bau, 0).itemid
	local name = string.sub(getItemNameById(item), 4 , 30)
	if not RaridadeTable[name] or string.sub(getItemNameById(item), 1 , 3) == "[L]" then return doPlayerSendTextMessage(cid, 22, "Fundição para este item não está disponivel") end
	fundir(cid, item, name, bau, effect)
end

function onUse(cid, item, frompos, item2, topos)
checkContainerBau(cid, frompos, 743)
return true
end