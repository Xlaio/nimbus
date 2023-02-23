
-- Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players");
-- Local Veriables
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
--Element
local Element = require(script.Element)
local Slider = require(script.Slider)
-- StyleSheet 
local stylesheet = require(script.stylesheet) -- Can't be changed.
local UIFramework = {} 
UIFramework.__index = UIFramework;

-- Parameter, Expected Type, Current Type
local ERR_INVALID_TYPE = "Invalid type for parameter '%s' (Expected %s, got %s)"
-- Instance, Container, Random
local ERR_NOTFOUND_TYPE = "'%s' not found (Expected %s, got %s)"

local ERR_NOT_INSTANCE = "Cannot Invoke staticly '%s' It is an Instance method, Call it on instance of Created Class '%s'";

function UIFramework.new(name : string?,Theme : string?)

    local self = setmetatable({}, UIFramework);
    self.Theme = stylesheet[Theme] or stylesheet
    self.PlayerGui = PlayerGui
    self.ScreenGui = Instance.new("ScreenGui",PlayerGui);
    self.ScreenGui.Name = name or "ScreenGui";
    -- #Events
    self.Elements = {}
    self.ConnectedEvents = {}
    return self
end
-- use UIFramework:CreateElement("Element", {} : Properties, {} : children)
function UIFramework:CreateElement(Component : string, Properties : table?, Children : table?,Class : string?) : table
    if(Component == "Slider") then  
        local ObjSlider = Slider.new(Properties)
        if (ObjSlider.Parent== nil) then -- Set the Parent of the Slider to either The screengui or the Parented Element
            ObjSlider.Parent = self.ScreenGui; 
        end
        return ObjSlider
    end
    local ObjElement = Element.new(Component,Properties,Children)
    -- Set the properitys of the element; 
    for key, value in pairs(self.Theme[Component]) do
        if (ObjElement.Properties[key]) then
            ObjElement.Component[key] = ObjElement.Properties[key]
        else
            ObjElement.Component[key] = value
        end
    end
    if (typeof(ObjElement.Children) == "table")  then   
        if (ObjElement.Children) then
            for _, child in pairs(ObjElement.Children) do
                child.Parent = ObjElement.Component
            end
        end
    elseif (typeof(ObjElement.Children) == "Instance") then
        ObjElement.Children.Parent = Element.Component
    end

    -- Check for duplicates
    -- Inserts the First Element to an ScreenGui
    if (ObjElement.Parent == nil) then
        ObjElement.Component.Parent = self.ScreenGui
    end

    self.Elements[ObjElement.Instance] = ObjElement.Instance
    return ObjElement
end

function UIFramework:GetElement(Name : string) : Instance
    return self.Elements[Name]
end

function UIFramework:BindEvents(element: Instance, events : {EventEnum : (InputObject: any, OutputObject : any) -> RBXScriptSignal})
	if (not element) or typeof(element) == "table" then warn((ERR_INVALID_TYPE):format("element","Gui Element",typeof(element))) return nil end
	for eventEnum, handler in pairs(events) do
        self.ConnectedEvents[element.Name] = element[eventEnum]:Connect(handler)
    end
    
end

function UIFramework:DisconnectEvents()
    if(self.ConnectedEvents == {}) then warn(("Empty Table %s"):format(self.ConnectedEvents)) return nil end;  
    for _, connection in pairs(self.ConnectedEvents) do
        connection:Disconnect();
    end
end


function UIFramework:Destroy()

    --[[
        TODO: make sure every element in every array that has been created is deleted.
    ]]
    setmetatable(self,nil)
end

return UIFramework;