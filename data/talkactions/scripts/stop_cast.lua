function onSay(player, words, param)
	local playerId = player:getId()
	if player:stopLiveCast(param) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have stopped casting your gameplay.")
		db.query("UPDATE `players` SET `cast` = 0 WHERE `id` = " .. playerId .. ";")
	else
		player:sendCancelMessage("You're not casting your gameplay.")
	end
	return false
end
