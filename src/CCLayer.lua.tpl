

local {{ classname }} = class("{{ classname }}",function()
    return display.new{{ super }}()
end)

function {{ classname }}:ctor()

end

return {{ classname }}