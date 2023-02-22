


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage:WaitForChild("Modules");
local UIFramework = require(Modules:FindFirstChild("UIFramework"));

local X = UIFramework.new("Menu");

---TEXTBUTTON 




-- X:CreateElement("Frame",{Name = "Infected"}, {
-- 	X:CreateElement("TextButton",{Name = "Play"}),
-- 	X:CreateElement("TextLabel",{},{X:CreateElement("TextButton")}),
-- 	X:CreateElement("TextButton")
-- })





local Button = X:CreateElement("TextButton",{Name = "Play"}):BindEvent(function()
	
end,"Activated")


local Frame = X:CreateElement("Frame",{Size = UDim2.fromScale(.5,.5), AnchorPoint = Vector2.new(.5,.5)}):AppendChildren({
	X:CreateElement("UIListLayout"),
	X:CreateElement("TextButton",{TextSize = 14}):Toggle(false),
	X:CreateElement("TextButton",{TextSize = 20}):Toggle(true),
	X:CreateElement("TextButton",{TextSize = 14}):Toggle(false),
	X:CreateElement("Slider",{initail = 10, min = 20, max = 100, increment = 5}),
})

X:BindEvents(Button:GetSelf(),{
	[UIFramework.Event.Activated] = function(InputObject,OutputObject)
		print("Hello world")
	end
})


