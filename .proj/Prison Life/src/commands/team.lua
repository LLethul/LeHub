return {
    info = {
        Name = "team";
        argTypeList = {"name"};
    };

    run = function(Self, Args)
        local teams = {
            Inmate = "Bright orange";
            Cop = "Bright blue";
            Criminal = "Really red";
            Prisoner = "Bright orange";
        }

        for i,v in pairs(teams) do
            if i:lower():find(Args[1]:lower()) then
                if i=="Criminal" then
                    local oldting = getgenv().LHPLFuncs.Blatant.GetPos()
                    getgenv().LHPLFuncs.Blatant.LoadChr(teams.Inmate)
                    wait(0.1)
                    getgenv().LHPLFuncs.Blatant.Goto(CFrame.new(-976.125183, 109.123924, 2059.99536))
                    wait(0.3)
                    getgenv().LHPLFuncs.Blatant.Goto(oldting)
                    return
                end
                local oldting = getgenv().LHPLFuncs.Blatant.GetPos()
                getgenv().LHPLFuncs.Blatant.LoadChr(v)
                wait(0.1)
                getgenv().LHPLFuncs.Blatant.Goto(oldting)
                return
            end
        end

        local oldting = getgenv().LHPLFuncs.Blatant.GetPos()
        getgenv().LHPLFuncs.Blatant.LoadChr("Medium stone grey")
        wait(0.1)
        getgenv().LHPLFuncs.Blatant.Goto(oldting)
    end
}