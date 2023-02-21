

local Animation = {
    ToggleStatic = {
        [true] = {
            BackgroundColor3 = Color3.fromHex("595095"),
            Text = "On",
        },
        [false] = {
            BackgroundColor3 = Color3.fromHex("201F27"),
            Text = "Off",
        }
    },
    ToggleAnimation = {
        TweenInfo = TweenInfo.new(.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),
        [true] = {
            TextSize = 20;
        },
        [false] = {
            TextSize = 14;
        }
    }
}

return Animation
