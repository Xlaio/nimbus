local Slider = {}
Slider.__index = Slider
-- Whenever the Slider is moving, just fire the ChangedBindable in it

function Slider.new(Properties,InitialPosition : number?, Minimum : number?, Maximum : number?)
    local self = setmetatable({},Slider);
    self.Properties = Properties or {}
    self.InitialPosition = InitialPosition or 0
    self.Minimum = Minimum or 0;
    self.Maximum = Maximum or 0
    --# Events
    self.ChangedBindable = Instance.new("BindableEvent")
    self.DraggedBindable = Instance.new("BindableEvent")
    self.ReleasedBindable = Instance.new("BindableEvent")
    return self
end

function Slider:SetProperties(Properties : table)
    
end


function Slider:__index(key)
    if (key == "Changed") then
        return self.ChangedBindable.Event
    elseif(key == "Dragged") then
        return self.DraggedBindable.Event
    elseif (key == "Released") then
        return self.ReleasedBindable.Event
    else 
        return rawset(self,key)
    end
end

function Slider:Destroy()
    --[[
        TODO: 
        Delete all connections
        Destroy
    ]]
end
return Slider