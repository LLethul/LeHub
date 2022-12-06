return {
    info = {
        Name = "god";
        argTypeList = {"nil"};
    };

    run = function(Self, Args)
        getgenv().LHPLFuncs.SetGod(not getgenv().LHPLFuncs.GetGod())
        getgenv().LHPLFuncs.UI.Notification("Set States.God to "..getgenv().LHPLFuncs.GetGod())
    end
}