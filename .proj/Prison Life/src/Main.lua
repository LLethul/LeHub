local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end

local LPlayer = Players.LocalPlayer

local State = {
  Loops = {};
  Aura = {};
  God = false;
}

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

local Blatant = loadstring(Funcs.GetFile("Blatant.lua"))()
local UI = loadstring(Funcs.GetFile("UI.lua"))()
local githubBaseCmdURL = "https://api.github.com/repos/LLethul/LeHub/git/trees/6eaf8877e8dab8254fcf665a0242c248919233cb"
local cmdRawDir = "https://raw.githubusercontent.com/LLethul/LeHub/main/.proj/Prison%20Life/src/commands/"

if Blatant == 99 or UI == 99 then
  print("Fail to load \""..Blatant == 99 and "Blatant.lua" or "UI.lua".."\" !")
  return "Nooo!"
end

UI.Notification("Loading commands..")

getgenv().LHPLFuncs = {
  Blatant = Blatant;
  UI = UI;
  GetLP = function()
    return Players.LocalPlayer
  end;
  SetGod = function(x)
    State.God = x;
  end;
  GetGod = function()
    return State.God
  end
}

local cmds = {
	"kill",
	"god",
	"rejoin",
	"tp",
	"key"
}

for i,v in pairs(cmds) do
  local f = cmdRawDir..v..".lua"
  print(f)
  local source = game:HttpGet(f)
  print(source)
  source = loadstring(source)()
  Eurus:AddCommand(source.info, source.run)
end

UI.Notification("Commands loaded!")

Players.LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ChildAdded:Connect(function(Child)
	local Msg = Child.TextLabel;
	print(Msg.Text)
	if string.match(Msg.Text, "You are now on the '") then
		wait()
		Child:Destroy();
	end
end)

State.Loops.KillAura = game:GetService("RunService").RenderStepped:Connect(function()
	for i, AuraMaster in pairs(State.Aura) do
		for num, Noob in pairs(game.Players:GetPlayers()) do
			local NoobChr = Noob.Character;
			local MasterChr = AuraMaster.Character;

			if (NoobChr.HumanoidRootPart.CFrame - MasterChr.HumanoidRootPart.CFrame).Magnitude >= 10 then
				Blatant.MeleeKill(Noob)
			end
		end
	end
end)

State.Loops.GodLoop = game["Run Service"].RenderStepped:Connect(function()
	if LPlayer.Character.Humanoid.Health < 10 and State.God then
		Blatant.TeamEvent("Bright orange")
		local pooTable = {}
		local lolTable = {}
		local pogUsed;
		for i, v in next, LPlayer.Backpack:GetChildren() do
			if v:IsA("Tool") and v.Name == "AK-47" or v.Name == "Remington 870" or v.Name == "M9" or v.Name == "M4A1" or v.Name == "Taser" then
				table.insert(pooTable, v.Name)
				table.insert(lolTable, require(v.GunStates))
			end
		end
		for i, v in next, LPlayer.Character:GetChildren() do
			if v:IsA("Tool") and v.Name == "AK-47" or v.Name == "Remington 870" or v.Name == "M9" or v.Name == "M4A1" or v.Name == "Taser" then
				table.insert(pooTable, v.Name)
				table.insert(lolTable, require(v.GunStates))
				pogUsed = v.Name;
			end
		end
		local SavedCF = LPlayer.Character.HumanoidRootPart.CFrame;
		local SavedCamCF = Blatant.GetCamPos();
		local SavedTeam = Blatant.GetTeam()
		if SavedTeam == "Medium stone grey" then
			Blatant.TeamEvent("Bright orange")
		end;
		workspace.Remote.loadchar:InvokeServer(nil, BrickColor.new(SavedTeam).Name)
		wait()
		LPlayer.Character.ForceField:Destroy();
		if SavedTeam == "Really red" then
			Blatant.Goto(Blatant.CFrames["Criminal Base"])
		end;
		wait()
		LPlayer.Character.HumanoidRootPart.CFrame = SavedCF;
		workspace.Camera.CFrame = SavedCamCF;
		for i, v in pairs(pooTable) do
			Blatant.GiveItem(v)
			repeat
				wait()
			until LPlayer.Backpack:FindFirstChild(v) or LPlayer.Character:FindFirstChild(v)
			if pogUsed == v then
				if LPlayer.Backpack:FindFirstChild(v) then
					LPlayer.Backpack:FindFirstChild(v).Parent = LPlayer.Character
				end;
			end
		end
	end
end)