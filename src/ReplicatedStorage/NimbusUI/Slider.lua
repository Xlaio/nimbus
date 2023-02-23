local Slider = {}
Slider.__index = Slider
-- Whenever the Slider is moving, just fire the ChangedBindable in it
--,InitialPosition : number?, Minimum : number?, Maximum : number?
function Slider.new(Properties: table, SnappingPoints : table?,FindNearestSnapPoint : boolean?)
    local self = setmetatable({},Slider);
    self.Properties = Properties or {}
    self.SnappingPoints = SnappingPoints or {}
    --#Slider Properties
    self.InitialPosition = 0
    self.Minimum = 0
    self.Maximum = 0
    --#Slider Logic 
    self.Dragging = false
    self.FindNearestSnapPoint = true or FindNearestSnapPoint
    --#Elements maybe use the X:Createelement("Slider)
    self.Container = Instance.new("Frame")
    self.Line = Instance.new("Frame")
    self.Slider = Instance.new("ImageButton")
    self.Label = Instance.new("TextLabel")

    --#Events
    self.ChangedBindable = Instance.new("BindableEvent")
    self.DraggingBindable = Instance.new("BindableEvent")
    self.ReleasedBindable = Instance.new("BindableEvent")
    return self
end

--[[
    TODO: Line Properties < Length based on Maximum, Height based on Propertie LineThichness
    Container, Properties, would include Height, Width\
    Label, Properties would include, The Text label size
    Slider, Would include the Size : Heigh = Widthl, Using font Awesome images 
]]
function Slider:SetSnappingPoints(SnappingPoints : table)
    
end

function Slider:SetProperties(Properties : table)

end


function Slider:__index(key)
    if (key == "Changed") then
        return self.ChangedBindable.Event
    elseif(key == "Dragging") then
        return self.DraggingBindable.Event
    elseif (key == "Released") then
        return self.ReleasedBindable.Event
    elseif (key == "Parent") then
        return self.Container.Parent
    else 
        return rawset(self,key)
    end
end

function Slider:Destroy()



    self.ReleasedBindable:Disconnect()
    self.DraggedBindable:Disconnect()
    self.ChangeBindable:Disconnect()
    setmetatable(self,{})
    --[[
        TODO: 
        Delete all connections
        Destroy
    ]]
end
return Slider