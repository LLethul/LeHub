local Players = game:GetService("Players")
return {
    info = {
        Name = "kill";
        argTypeList = {"player"};
    };

    run = function(Self, Args)
        if Args[1] == Players:GetPlayers() then
            local e = game.ReplicatedStorage.meleeEvent;
            local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
            workspace.Remote.TeamEvent:FireServer("Medium stone grey");
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
            repeat wait()
            local start = tick();
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame;
            e:FireServer(v);
            game.Players.LocalPlayer.Character.Humanoid.Sit = false;
            until v.Character.Humanoid.Health == 0 or tick() - start >= 6
            end
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos;
        end
        
        for i,v in pairs(Args[1]) do
            getgenv().LHPLFuncs.Blatant.Kill(v)
            if Self == getgenv().LHPLFuncs.GetLP() then
                getgenv().LHPLFuncs.UI.Notification("Killed "..v.Name)
            else
                getgenv().LHPLFuncs.UI.Chat("Killed "..v.Name, Self)
            end
        end
    end
}