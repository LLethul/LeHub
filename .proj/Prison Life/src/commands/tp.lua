return {
    info = {
        Name = "tp";
        argTypeList = {"player", "player"};
    };

    run = function(Self, Args)
        for i,v in pairs(Args[1]) do
            for k,b in pairs(Args[2]) do
                getgenv().LHPLFuncs.Blatant.Teleport(v,b)
            end
        end
    end
}