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
            Neutral = "Medium Greystone"
        }

        for i,v in pairs(teams) do
            if i:lower():find(Args[1]:lower()) then
                getgenv().LHPLFuncs.Blatant.TeamEvent(v)
                return
            end
        end

        getgenv().LHPLFuncs.Blatant.TeamEvent("Medium Greystone")
    end
}