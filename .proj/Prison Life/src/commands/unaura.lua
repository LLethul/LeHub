return {
    info = {
        Name = "unaura";
        argTypeList = {"player"};
    };

    run = function(Self, Args)
        for i,v in pairs(Args[1]) do
            if table.find(getgenv().LHPHFuncs.GetState().Aura, v) then
                table.remove(getgenv().LHPHFuncs.GetState().Aura,table.find(getgenv().LHPHFuncs.GetState().Aura, v))
            end
        end
    end
}