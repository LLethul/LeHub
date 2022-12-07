return {
    info = {
        Name = "team";
        argTypeList = {"name"};
    };

    run = function(Self, Args)
        local teams = {
            Inmate = "Bright orange";
            Cop = "Really blue";
            Criminal = "Really red";
            Neutral = "Medium stone grey";
            Prisoner = "Bright orange";
        }

        for i,v in pairs(teams) do
            if i:lower():find(Args[1]:lower()) then
                if i=="Criminal" then
                    local oldting = getgenv().LHPLFuncs.Blatant.GetPos()
                    getgenv().LHPLFuncs.Blatant.TeamEvent(teams.Inmate)
                    getgenv().LHPLFuncs.Blatant.Goto(getgenv().LHPLFuncs.Blatant.CFrames["Criminal Base"])
                    wait(0.1)
                    getgenv().LHPLFuncs.Blatant.Goto(oldting)
                    return
                end
                getgenv().LHPLFuncs.Blatant.TeamEvent(v)
                return
            end
        end

        getgenv().LHPLFuncs.Blatant.TeamEvent("Medium Greystone")
    end
}