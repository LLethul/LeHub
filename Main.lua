local HttpService = game:GetService("HttpService")
local GID = game.GameId;
local gamesMapUrl = "https://raw.githubusercontent.com/LLethul/LeHub/main/gameMap.json";
local gamesMap = HttpService:JSONDecode(game:HttpGet(gamesMapUrl))

if gamesMap[GID] ~= nil then
    local path = gamesMap[GID].loaderUrl
    local source = game:HttpGet(path)

    if source == "" or source == nil then
        print("[LEHUB MAIN]: Error! Cannot exec script for GID "..GID..". Source is nil!")
    end

    local s,e = pcall(function()
        loadstring(source)()
    end)

    if s then
        print("[LEHUB MAIN]: Success! Exec script for GID "..GID..".")
    else
        print("[LEHUB MAIN]: Error! Cannot exec script for GID "..GID..". Error: "..e)
    end
else
    print("[LEHUB MAIN]: Error! Cannot find script for GID "..GID..".")
end