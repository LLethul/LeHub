return {
    info = {
        Name = "get";
        argTypeList = {"string"};
    };

    run = function(Self, Args)
        getgenv().LHPLFuncs.Blatant.GiveItem(Args[1])
    end
}