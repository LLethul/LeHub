
return {
    info = {
        Name = "rejoin";
        argTypeList = {"nil"};
    };

    run = function(Self, Args)
        getgenv().LHPLFuncs.UI.Notification("Rejoining server")
        wait(.1)
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
}