function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
setPlayerStorageValue(cid, 40113, 3)
doPlayerAtualSaga(cid)
return true
end