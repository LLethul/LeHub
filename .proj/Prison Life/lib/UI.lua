local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local function Notification(Text)
	local Tooltip = Players.LocalPlayer.PlayerGui.Home.hud.AddedGui.tooltip;
	Tooltip.Visible = true;
	Tooltip.BackgroundTransparency = 0.25;
	Tooltip.TextLabel.TextTransparency = 0;
	Tooltip.ImageLabel.ImageTransparency = 0.41;
	Tooltip.TextLabel.ZIndex = 10;
	Tooltip.TextLabel.Text = Text;
	delay(3, function()
		game:GetService("TweenService"):Create(Tooltip.ImageLabel, TweenInfo.new(1.5), {
			ImageTransparency = 1
		}):Play()
		game:GetService("TweenService"):Create(Tooltip.TextLabel, TweenInfo.new(1.5), {
			TextTransparency = 1
		}):Play()
		game:GetService("TweenService"):Create(Tooltip, TweenInfo.new(1.5), {
			BackgroundTransparency = 1
		}):Play()
	end)
end

local function Chat(Text, Whisper)
	if Whisper then
		ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w " .. Whisper.Name .. " " .. Text, "All")
	else
		ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Text, "All")
	end
end

local function ClientChat(Text, Colors, Size, Font)
	StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = Text,
		Color = Colors or Color3.fromRGB(255, 255, 255),
		Font = Enum.Font[Font] or Enum.Font.Code,
		FontSize = Size or Enum.FontSize.Size48
	})
end

Players.LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ChildAdded:Connect(function(Child)
	local Msg = Child.TextLabel;
	print(Msg.Text)
	if string.match(Msg.Text, "You are now on the '") then
		wait()
		Child:Destroy();
	end
end)

coroutine.wrap(function()
	if game.PlaceId == 155615604 then
		repeat wait() until game.Players.LocalPlayer.PlayerGui.Home:FindFirstChild("fadeFrame")
		local rs = game:GetService("RunService")
		local fps
		local ratio
		local number = 0
		while true do
			fps = 1 / (rs.Heartbeat:Wait())
			if fps > 60 then
				game.Players.LocalPlayer.PlayerGui.Home.fadeFrame:Destroy()
			end
			ratio = 60 / fps
			number = number + 1
			local position = ((400) * number) * ratio
		end
	end
end)()

return {
	Notification = Notification;
	ClientChat = ClientChat;
	Chat = Chat;
}