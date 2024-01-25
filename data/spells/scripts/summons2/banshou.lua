local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)


[color="#FF0000"][b]arr[/b][/color] = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 3, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function abs(i)
if(i>0) then
return i
else return (i*(-1))
end
end

function onCastSpell(cid, var)
pos=getPlayerPosition(cid)
player = getThingfromPos({x=pos.x,y=pos.y,z=pos.z,stackpos= 253})
[color="#000080"][b]raio[/color][/b]=5 --alcance do buraco negro
i=((pos.x)-raio)
while(i<=((pos.x)+raio)) do
j=((pos.y)-raio)
while(j<=((pos.y)+raio)) do
player=getThingfromPos({x=i,y=j,z=pos.z,stackpos=2 53})
if(((getPlayerLevel(player.uid)>0) or (isCreature(player.uid)==1))and ((abs(i-(pos.x)) > 1) or (abs(j-(pos.y)) > 1))) then

-- calcula novo X
if(i<pos.x) then 
newx=i+1
elseif(i==pos.x) then
newx=i
else newx=i-1
end

-- calcula novo Y
if(j<pos.y) then 
newy=j+1
elseif(j==pos.y) then
newy=j
else newy=j-1
end

npos={x=newx,y=newy,z=pos.z}
doSendMagicEffect(npos,2)
doTeleportThing(player.uid,npos)
end
j=j+1
end
i=i+1
end
doCombat(cid, combat, var)
end 