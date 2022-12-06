return {
    info = {
        Name = "extcmd";
        argTypeList = {"url"};
    };

    run = function(Self, Args)
        local typeo = Args[1]:split(':')[1]

        if typeo == "lf" then
            -- lf:ixhub/pl/commands/test.lua
            local path = Args[1]:split(':')[2]
            local src = readfile(path)
            src = loadstring(src)()

            getgenv().LHPLFuncs.AddCommand(src)
        else
            -- https://(etc)
            local src = game:HttpGet()
            src = loadstring(src)()

            getgenv().LHPLFuncs.AddCommand(src)
        end
    end
}