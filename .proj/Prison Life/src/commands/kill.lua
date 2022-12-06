return {
    info = {
        Name = "kill";
        argTypeList = {"player"};
    };

    run = function(Self, Args)
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