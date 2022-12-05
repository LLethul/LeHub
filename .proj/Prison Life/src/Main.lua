local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end

local Funcs = {
  GetFile = function(name)
    if isfolder("ixhub") then
      if isfolder('ixhub/pl') then
        if betterisfile('ixhub/pl/'..name) then
          return readfile("ixhub/pl/"..name)
        else
          return 'return 99'
        end
      else
        return 'return 99'
      end
    else
      return 'return 99'
    end
  end
}

local Eurus = loadstring(
  game:HttpGet"https://raw.githubusercontent.com/LLethul/eurus/main/src/index.lua"
)();

local Blatant = loadstring(Funcs.GetFile("Blatant.lua"))
local UI = loadstring(Funcs.GetFile("UI.lua"))

if Blatant == 99 or UI == 99 then
  print("Fail to load \""..Blatant == 99 and "Blatant.lua" or "UI.lua".."\" !")
  return "Nooo!"
end
  
Eurus:SetScriptData({
  Prefix = ";";
  ScriptName = "IxHub | PrisonLife";
});

Eurus:AddCommand("kill", {
    --// Aliases
    "end"
  }, {
    --// Command metadata
    Description = "Kill your enemies!"
  }, function(Self, Args)
    
  end)