-- game:GetService("MarketplaceService"):UserOwnsGamePassAsync(tonumber((game:GetService("Players").LocalPlayer.CharacterAppearance):split('=')[#((game:GetService("Players").LocalPlayer.CharacterAppearance):split('='))]), 96651),
-- getgenv().LHPLFuncs.Blatant.GiveItem("M9")
-- 			getgenv().LHPLFuncs.Blatant.GiveItem("AK-47")
-- 			getgenv().LHPLFuncs.Blatant.GiveItem("Remington 870")
-- 			getgenv().LHPLFuncs.Blatant.GiveItem("M4A1")

return {
    info = {
        Name = "guns";
        argTypeList = {};
    };

    run = function(Self, Args)
        getgenv().LHPLFuncs.Blatant.GiveItem("M9")
		getgenv().LHPLFuncs.Blatant.GiveItem("AK-47")
		getgenv().LHPLFuncs.Blatant.GiveItem("Remington 870")
        if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(tonumber((game:GetService("Players").LocalPlayer.CharacterAppearance):split('=')[#((game:GetService("Players").LocalPlayer.CharacterAppearance):split('='))]), 96651) then
            getgenv().LHPLFuncs.Blatant.GiveItem("M4A1")
        end
    end
}