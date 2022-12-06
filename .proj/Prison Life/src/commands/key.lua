return {
    info = {
        Name = "kill";
        argTypeList = {"nil"};
    };

    run = function(Self, Args)
        if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single:FindFirstChild("Key card").ITEMPICKUP)
			getgenv().LHPLFuncs.UI.Notification("Got keycard");
			return;
		else
			getgenv().LHPLFuncs.UI.Notification("No keycards are availible. Making one");
			local HadGod = getgenv().LHPLFuncs.GetGod() == true
			local pos = getgenv().LHPLFuncs.Blatant.GetPos()
			local cpos = getgenv().LHPLFuncs.Blatant.GetCamPos()
			local lol = getgenv().LHPLFuncs.Blatant.GetTeam()
			local stop = false;
			repeat
				wait()
				getgenv().LHPLFuncs.SetGod(true)
				getgenv().LHPLFuncs.Blatant.LoadChr("Bright blue")
				getgenv().LHPLFuncs.GetLP().Character:BreakJoints()
				getgenv().LHPLFuncs.Blatant.Goto(pos)
				workspace.CurrentCamera.CFrame = cpos
			until workspace.Prison_ITEMS.single:FindFirstChild("Key card") or stop == true
			if stop == true then
				return;
			end;
			if lol == "Medium stone grey" then
				lol = "Bright orange"
			end;
			getgenv().LHPLFuncs.Blatant.LoadChr(lol)
			wait(0.3)
			getgenv().LHPLFuncs.SetGod(HadGod)
			if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single:FindFirstChild("Key card").ITEMPICKUP)
				getgenv().LHPLFuncs.UI.Notification("Got keycard");
				return;
			end
		end
    end
}