local Players = game:GetService("Players")
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
  end;

  FindPlayer = function(Text)
    for _, Player in pairs(Players:GetPlayers()) do
        if (Player.Name:lower():find(Text:lower()) or Player.DisplayName:lower():find(Text:lower())) then
            return Player
        end
    end
end
}

local Eurus = loadstring(
  game:HttpGet"https://raw.githubusercontent.com/LLethul/Eurus/main/src/index.lua"
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

UI.Notification("Loading commands..")

Eurus:AddCommand({
  Name = "kill";
  argTypeList = {'player'}
}, function(Self, Args)
  for i,v in pairs(Args[1]) do
    Blatant.Kill(v)
  end
end)

UI.Notification("Commands loaded!")