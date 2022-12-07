local Players = game:GetService("Players")
return {
    info = {
        Name = "bring";
        argTypeList = {"player"};
    };

    run = function(Self, Args)
        for i,v in pairs(Args[1]) do
            getgenv().LHPLFuncs.Blatant.Teleport(v,Players.LocalPlayer)
        end
    end
}