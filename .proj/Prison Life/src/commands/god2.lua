local Players = game:GetService("Players")
return {
    info = {
        Name = "god2";
        argTypeList = {"on"};
    };

    run = function(Self, Args)
        if Args[1]:lower() == "on" then
            Players.LocalPlayer.Character.Humanoid.Name = 1
            local l = Players.LocalPlayer.Character["1"]:Clone()
            l.Parent = Players.LocalPlayer.Character
            l.Name = "Humanoid"
            wait(0.1)
            Players.LocalPlayer.Character["1"]:Destroy()
            game:GetService("Workspace").CurrentCamera.CameraSubject = Players.LocalPlayer.Character
            Players.LocalPlayer.Character.Animate.Disabled = true
            wait(0.1)
            Players.LocalPlayer.Character.Animate.Disabled             = false
            Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
        elseif Args[1]:lower() == "off" then
            Players.LocalPlayer.Character.Humanoid.Health = 0
            local a1 = Instance.new("Model", workspace)
            local a2 = Instance.new("Part", a1)
            a2.CanCollide = true
            a2.Anchored = true
            a2.CFrame = CFrame.new(10000, 10000, 10000)
            a2.Name = "Torso"
            local a3 = Instance.new("Humanoid", a1)
            a3.MaxHealth=100;a3.Health=100
            game.Players.LocalPlayer.Character = a1
            a3.Health=0
        else
            getgenv().LHPLFuncs.UI.Notification("Auto setting god2 to on. Next time, specify wether to make it 'off' or 'on'. ")
            Players.LocalPlayer.Character.Humanoid.Name = 1
            local l = Players.LocalPlayer.Character["1"]:Clone()
            l.Parent = Players.LocalPlayer.Character
            l.Name = "Humanoid"
            wait(0.1)
            Players.LocalPlayer.Character["1"]:Destroy()
            game:GetService("Workspace").CurrentCamera.CameraSubject = Players.LocalPlayer.Character
            Players.LocalPlayer.Character.Animate.Disabled = true
            wait(0.1)
            Players.LocalPlayer.Character.Animate.Disabled             = false
            Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
        end
    end
}