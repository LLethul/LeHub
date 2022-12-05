

local Eurus = loadstring(
  game:HttpGet"https://raw.githubusercontent.com/LLethul/eurus/main/src/index.lua"
)();
  
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