return {
    info = {
        Name = "loopkill";
        argTypeList = {"player"};
    };

    run = function(Self, Args)
        local function addToTableInState(tblIdx, entry)
            local fakeTbl = getgenv().LHPLFuncs.GetState()
            table.insert(fakeTbl[tblIdx], entry)

            getgenv().LHPLFuncs.ModState(tblIdx, fakeTbl[tblIdx])
        end

        for i,v in pairs(Args[1]) do
            addToTableInState("Loopkill", v)
        end
    end
}