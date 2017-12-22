TIMER_NAME="cancel_auth_loader"
timer.Create(TIMER_NAME,5,5,function()
	if ulx then
		timer.Remove("cancel_auth_loader")
		function ulx.steamauth(calling_ply,target_ply)
			if target_ply:IsListenServerHost() then
				ULib.tsayError(calling_ply,"This player is immune to kicking",true)
				return
			end
			ulx.fancyLogAdmin( calling_ply, "#A Canceled the steam auth ticket of #T", target_ply )
			ULib.kick(target_ply,"Client left game (Steam auth ticket has been canceled)")
		end
		local cancel_auth=ulx.command("Fun","ulx cancel_auth",ulx.steamauth,"!cancel_auth")
		cancel_auth:addParam{type=ULib.cmds.PlayerArg}
		cancel_auth:defaultAccess(ULib.ACCESS_ADMIN)
		cancel_auth:help("cancel someone's steam authentication ticket")
		print("loaded "..TIMER_NAME)
	elseif timer.RepsLeft(TIMER_NAME)==1 then
		error("ulx and ulib MUST be installed")
	end
end)