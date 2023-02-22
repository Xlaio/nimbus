--#Game Service
local TweenService = game:GetService("TweenService");
--#Modules/Config
local AnimationConfig = require(script.Animation);
--#Events
local Element = {}
Element.__index = Element

function Element.new(Component : string, Properties : table?, Children : table?)
    local self = setmetatable({},Element)
    -- Check If Component Is even a thing cuh
    self.Component = Instance.new(Component)
    self.Properties = Properties or {}
    self.Children = Children or {}
    --#Events
    self.BindedEvents = {}
    return self
end

function Element:GetParent()
    return self.Component.Parent;
end

function Element:GetSelf()
    return self.Component
end

function Element:GetChildren()
    return self.Children
end

function Element:BindEvent(Handler : (InputObject : any, OutputObject : any) -> RBXScriptConnection, eventEnum : string)
    -- Check if there is already of the same connections to that element.
    if(typeof(self.BindedEvents[self.Component]) == "RBXScriptConnection") then warn("Already Bound") return nil end;
    self.BindedEvents[self.Component] = self.Component[eventEnum]:Connect(Handler);
    return self
end

function Element:unBindEvent()
    if(self.BindedEvents[self.Component] == nil) then warn() return false end 
    self.BindedEvents[self.Component]:Disconnect()
    return self
end

function Element:SetProperties(Properties : table)
    if (typeof(Properties) ~= "table") then warn() return self end
    for key, value in pairs(Properties) do
        self.Component[key] = Properties[key]
    end
    return self
end

function Element:GetPropertie(Type)
    if (typeof(self.Component) ~= "Instance") then warn() return self end
    return self.Component[Type]
end

function Element:AppendChildren(Children : table)
    if (typeof(Children) ~= "table") then warn() return self end
    for _,child in pairs(Children) do
        child:GetSelf().Parent = self.Component
    end
    self.Children = Children
    return self
end

function Element:AppenedChild(Child)
    if not(typeof(Child) == "Instance") then warn() return self end
    Child.Parent = self.Component
    return self
end

function Element:SetAttribute(Name : string, Value : any)
    if not (Name or Value) then warn() return nil end
    self.Component:SetAttribute(Name,Value)
    return self
end

function Element:GetAttribute(Name : string)
    if not (Name) then warn() return nil end
    return self.Component:GetAttribute(Name)
end

function Element:AttributeChanged(func)
    return self.Component.AttributeChanged:Connect(func)
end

function Element:GetAttributeValue(Name : string)
    if not (Name) then warn() return nil end
    for AName,AValue in pairs(self.Component:GetAttributes()) do
        if(AName == Name) then
            return AValue
        end
    end
    return self
end
-- Custom Events / Elements


--[[
    TODO, Attach functionalties with animations in this object
]]

function Element:Toggle(State : boolean?, Animate : boolean?)
    State = State or false
    Animate = Animate or true
    self:SetProperties(AnimationConfig.ToggleStatic[State])
    self:BindEvent(function(InputObject, OutputObject)
        State = not State
        self:SetAttribute("Toggle",State)
        self:SetProperties(AnimationConfig.ToggleStatic[State])
        if Animate then
            TweenService:Create(self.Component,AnimationConfig.ToggleAnimation.TweenInfo,AnimationConfig.ToggleAnimation[State]):Play()
        end
    end,"Activated")

    return self
end

return Element
