-- &a = weapon attack
-- &d = weapon defense
-- &s = shield defense
-- # = nivel do item
-- @ = max level
local gain = {
gainShield='&s+(40)',loseShield='&s-(40)',
gainAttack='&a+(30)',loseAttack='&a-(30)',
gainDefense='&d+(30)',loseDefense='&d-(30)',
maxlvl = 20,
blocked_ids = {8881}
}
local it = {
{item = 5921, chances = {{18,10},{15,20},{12,40},{8,50},{5,70},{0,100}}}
}
local function chanceRefine(refine, level)
for a,b in pairs(it) do
    if b.item == refine then
        for i=1, table.maxn(b.chances) do
	    	if level >= b.chances[i][1] then
			-- doBroadcastMessage(" "..b.chances[i][1].."  "..level.."  "..b.chances[i][2].."",21)
			return b.chances[i][2]
			end
			
		end
    end
end
end


if not setItemName then
function setItemName(uid,name)
return doItemSetAttribute(uid,'name',name)
end
function setItemDefense(uid,name)
return doItemSetAttribute(uid,'defense',name)
end
function setItemAttack(uid,name)
return doItemSetAttribute(uid,'attack',name)
end
function getItemAttack(uid)
return getItemAttribute(uid,'attack')
end
function getItemDefense(uid)
return getItemAttribute(uid,'defense')
end
end


local function doTransform(s,i) -- Function by Mock the bear.
local c = string.gsub(s,'@',gain.maxlvl)
local c = string.gsub(c,'&a',(getItemAttack(i.uid) ~= 0 and getItemAttack(i.uid) or getItemInfo(i.itemid).attack))
local c = string.gsub(c,'&d',(getItemDefense(i.uid) ~= 0 and getItemDefense(i.uid) or getItemInfo(i.itemid).defense))
local c = string.gsub(c,'&s',(getItemDefense(i.uid) ~= 0 and getItemDefense(i.uid) or getItemInfo(i.itemid).defense))
local q = assert(loadstring('return '..c))
return math.floor(assert(q()))
end
local function addAttributes(item, weapon)
if (weapon == 1 or weapon == 2 or weapon == 3) then
setItemAttack(item.uid, doTransform(gain.gainAttack,item))
setItemDefense(item.uid, doTransform(gain.gainDefense,item))
elseif (weapon == 4) then
setItemAttack(item.uid, doTransform(gain.gainAttack,item))
elseif (weapon == 5) then
setItemDefense(item.uid, doTransform(gain.gainShield,item))
end
end

local function removeAttributes(item, weapon)
if (weapon == 1 or weapon == 2 or weapon == 3) then
setItemAttack(item.uid, doTransform(gain.loseAttack,item))
setItemDefense(item.uid, doTransform(gain.loseDefense,item))
elseif (weapon == 4) then
setItemAttack(item.uid, doTransform(gain.loseAttack,item))
elseif (weapon == 5) then
setItemDefense(item.uid, doTransform(gain.loseShield,item))
end
end

local function getWeaponLevel(uid)
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end


function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.uid == 0 or item.itemid == 0 then return false end
if isCreature(itemEx.uid) then return false end
local weapon = getItemWeaponType(itemEx.uid)
if isInArray(gain.blocked_ids, itemEx.itemid)
or (not weapon or weapon > 5 or weapon < 1)
or itemEx.itemid == 0 or isItemStackable(itemEx.uid) then
doPlayerSendCancel(cid, "You cant refine this item.")
return true
end

local level = getWeaponLevel(itemEx)
if level == gain.maxlvl then
doSendMagicEffect(toPosition, 2)
return doPlayerSendCancel(cid, "Your item is on max level, you can't upgrade it.")
end

toPosition.stackpos = 255
local chance = chanceRefine(item.itemid, level)
if chance >= math.random(0,100) then
local nm = getItemName(itemEx.uid)
local slot = nm:match('(%[.+%])') or '' ---If you server use slot system dont change it 
slot = slot~='\n' and '\n'..slot or slot
local s = setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' \n REFINE: +'..(level+1)..slot)
addEvent(doPlayerSendCancel,1000,cid, "Your item has been upgrated to +"..(level+1)..slot..".")
doSendAnimatedText(getCreaturePosition(cid), 'Sucess!', 35, cid)
doSendMagicEffect(toPosition, 5)
addAttributes(itemEx, weapon)
else
if level == 0 then
addEvent(doPlayerSendCancel,500,cid, "No effect.")
doSendMagicEffect(toPosition, 2)
elseif level > 0 then
local nm = getItemName(itemEx.uid)
local slot = nm:match('(%[.+%])') or '' ---If you server use slot system dont change it 
slot = slot~='\n' and ' \n'..slot or slot
if level == 1 then
setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..slot)
addEvent(doPlayerSendCancel,500,cid, "Your item back to normal.")
else
setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' \n REFINE: +'..(level-1)..slot)
addEvent(doPlayerSendCancel,500,cid, "Your item back to +"..(level-1)..slot..".")
end
removeAttributes(itemEx, weapon)
end
doSendAnimatedText(getCreaturePosition(cid), 'Fail!', 114, cid)
doSendMagicEffect(toPosition, 3)
end
doRemoveItem(item.uid,1)
return true
end