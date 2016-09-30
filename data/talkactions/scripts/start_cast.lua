function onSay(player, words, param)
	if param == "on" then
		param = nil
	end
	local playerId = player:getId()

	if player:startLiveCast(param) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have started casting your gameplay. Commands: !spectators - !stopcast")
		db.query("UPDATE `players` SET `cast` = 1 WHERE `id` = " .. playerId .. ";")
	else
		player:sendCancelMessage("You're already casting your gameplay.")
	end
	return false
end
