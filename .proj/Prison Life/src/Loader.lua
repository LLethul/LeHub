local rootDir = "https://raw.githubusercontent.com/LLethul/LeHub/main/.proj/Prison%20Life/"
local files = {
    "lib/Blatant.lua",
    "lib/UI.lua",
    "src/Main.lua"
}

local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end

function writeFile(name, src)
    if isfolder("ixhub") then
        if isfolder("ixhub/pl") then
            writefile("ixhub/pl/"..name, src)
        else
            makefolder("ixhub/pl")
        end
    else
        makefolder("ixhub")
    end
end

for hash, file in pairs(files) do
    local source = game:HttpGet(rootDir..file)
    local waitbruh = string.split(file,"/")
    waitbruh = waitbruh[#waitbruh]
    print("Writing "..waitbruh.." to $WORKSPACE/ixhub/pl ("..hash.." / "..#files..")")
    writeFile(waitbruh, source)
end
if betterisfile('ixhub/pl/Main.lua') then
    loadstring(readfile('ixhub/pl/Main.lua'))
else
    error("Couldnt find main! Run this script again to retry.")
end