
-- if data.customClass and data.customClass != ""
local {{ classname }} = class("{{ classname }}",CCBNodeExtend.extend(require("app.views.{{ data.customClass }}")))
-- else
local {{ classname }} = class("{{ classname }}",function()
    return CCBNodeExtend.extend(display.new{{ super }}())
end)
-- endif

-- import 'CCNode.lua' as CCNode
-- import 'CCSprite.lua' as CCSprite
-- import 'CCLayerColor.lua' as CCLayerColor
-- import 'CCLayer.lua' as CCLayer

-- macro rennder_tree(data,parent)
    -- for item in data.children
        -- set testing = parent
        -- if item.baseClass == "CCNode"
{{ CCNode.rennder(item,parent) }}
            -- set testing = "node"
        -- elif item.baseClass == "CCSprite"
{{ CCSprite.rennder(item,parent) }}
            -- set testing = "sprite"
        -- elif item.baseClass == "CCLayerColor"
{{ CCLayerColor.rennder(item,parent) }}
            -- set testing = "layer"
        -- elif item.baseClass == "CCLayer"
{{ CCLayer.rennder(item,parent) }}
            -- set testing = "layer"            
        -- endif
        -- if item.children
            -- if item.memberVarAssignmentName != ""
            -- endif
{{ rennder_tree(item,testing) }}
        -- endif
    -- endfor
{{'\n'}}
-- endmacro


{{'\n'}}
function {{ classname }}:ctor()
{{ CCNode.rennder_base_properties("self",data.properties) }}
{{ rennder_tree(data,"self") }}

end

return {{ classname }}