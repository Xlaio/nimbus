

-- Fonts
local Poppins = Font.new('rbxassetid://11702779409',Enum.FontWeight.Regular,Enum.FontStyle.Normal)



local PrimaryColor = Color3.fromHex("0F0E13");
local SecondaryColor = Color3.fromHex("17161E");
local AccentColor = Color3.fromHex("595095");
local TextPrimaryColor = Color3.fromHex("FFFFFF");


local stylesheet = {
    TextButton = {
        Name = "TextButton",
        Size = UDim2.fromScale(.2,.2),
        Position = UDim2.fromScale(.2,.2),
        BorderSizePixel = 0,
        TextSize = 12,
        BackgroundColor3 = PrimaryColor,
        BackgroundTransparency = 0,
        FontFace = Poppins,
        LineHeight = 1,
        TextStrokeTransparency = 0,
        AutoButtonColor = false,
        TextColor3 = TextPrimaryColor
    },
    Frame = {
        Name = "Frame",
        Size = UDim2.fromScale(.2,.2),
        Position = UDim2.fromScale(.2,.2),
        BorderSizePixel = 0,
        BackgroundColor3 = PrimaryColor,
        BackgroundTransparency = 0,
    },
    UIListLayout = {

    },
    TextLabel = {
        
    }
    

}




return stylesheet