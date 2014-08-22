
-- if data.customClass and data.customClass != ""
local {{ classname }} = class("{{ classname }}",require("app.views.{{ data.customClass }}"))
-- else
local {{ classname }} = class("{{ classname }}",function()
    return display.new{{ super }}()
end)
-- endif

-- import 'CCNode.lua' as CCNode
-- import 'CCSprite.lua' as CCSprite
-- import 'CCLayerColor.lua' as CCLayerColor
-- import 'CCLayer.lua' as CCLayer
-- import 'CCBFile.lua' as CCBFile
-- import 'CCLabelTTF.lua' as CCLabelTTF
-- import 'CCScale9Sprite.lua' as CCScale9Sprite
-- import 'CCMenu.lua' as CCMenu
-- import 'CCMenuItemImage.lua' as CCMenuItemImage

-- macro rennder_tree(data,parent)
    -- for item in data.children
        -- set temp_parent = parent
        -- if item.baseClass == "CCNode"
{{ CCNode.rennder(item,temp_parent) }}
            -- set temp_parent = "node"
        -- elif item.baseClass == "CCSprite"
{{ CCSprite.rennder(item,temp_parent) }}
            -- set temp_parent = "sprite"
        -- elif item.baseClass == "CCLayerColor"
{{ CCLayerColor.rennder(item,temp_parent) }}
            -- set temp_parent = "mask"
        -- elif item.baseClass == "CCLayer"
{{ CCLayer.rennder(item,temp_parent) }}
            -- set temp_parent = "layer"            
        -- elif item.baseClass == "CCBFile"
{{ CCBFile.rennder(item,temp_parent,ccbdata) }}
            -- set temp_parent = "ccb"            
        -- elif item.baseClass == "CCLabelTTF"
{{ CCLabelTTF.rennder(item,temp_parent) }}
            -- set temp_parent = "ttf"            
        -- elif item.baseClass == "CCScale9Sprite"
{{ CCScale9Sprite.rennder(item,temp_parent) }}
            -- set temp_parent = "sprite9"
        -- elif item.baseClass == "CCMenu"
{{ CCMenu.rennder(item,temp_parent) }}
            -- set temp_parent = "menu"
        -- elif item.baseClass == "CCMenuItemImage"
{{ CCMenuItemImage.rennder(item,temp_parent) }}
            -- set temp_parent = "menuitemimage"
        -- endif
        -- if item.children
            -- if item.memberVarAssignmentName != ""
            -- endif
{{ rennder_tree(item,temp_parent) }}
        -- endif
    -- endfor
{{'\n'}}
-- endmacro


{{'\n'}}
function {{ classname }}:ctor(_owner)
{{ CCNode.rennder_base_properties("self",data.properties,"nil") }}
{{ rennder_tree(data,"self") }}

end

return {{ classname }}