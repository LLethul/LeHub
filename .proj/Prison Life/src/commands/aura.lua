return {
    info = {
        Name = "aura";
        argTypeList = {"player"};
    };

    run = function(Self, Args)
        for i,v in pairs(Args[1]) do
            getgenv().LHPLFuncs.SetAura(v)
        end
    end
}