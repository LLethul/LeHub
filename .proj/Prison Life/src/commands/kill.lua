return {
    info = {
        Name = "kill";
        argTypeList = {"player"};
    };

    run = function(Self, Args, Funcs)
        for i,v in pairs(Args[1]) do
            Funcs.Blatant.Kill(v)
            if Self == Funcs.GetLP() then
                Funcs.UI.Notification("Killed "..v.Name)
            else
                Funcs.UI.Chat("Killed "..v.Name, Self)
            end
        end
    end
}