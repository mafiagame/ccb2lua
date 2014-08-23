
local {{ classname }} = class("{{ classname }}",function()
    return display.new{{ super }}()
end)

-- import 'CCNode.lua' as CCNode
-- import 'CCSprite.lua' as CCSprite
-- import 'CCLayerColor.lua' as CCLayerColor
-- import 'CCLayer.lua' as CCLayer
-- import 'CCBFile.lua' as CCBFile
-- import 'CCLabelTTF.lua' as CCLabelTTF
-- import 'CCScale9Sprite.lua' as CCScale9Sprite
-- import 'CCMenu.lua' as CCMenu
-- import 'CCMenuItemImage.lua' as CCMenuItemImage
-- import 'CCScrollView.lua' as CCScrollView
-- import 'CCControlButton.lua' as CCControlButton


-- macro rennder_tree(data,parent)
    -- for data in data.children
        -- set item_count = getIndex()
        -- set name = ""
        -- if data.baseClass == "CCNode"
            -- set name = "node"+ "_" +tostr(item_count)
{{ CCNode.rennder(data,name,parent) }}
        -- elif data.baseClass == "CCSprite"
            -- set name = "sprite"+ "_" +tostr(item_count)
{{ CCSprite.rennder(data,name,parent) }}
        -- elif data.baseClass == "CCLayerColor"
            -- set name = "mask"+ "_" +tostr(item_count)
{{ CCLayerColor.rennder(data,name,parent) }}
        -- elif data.baseClass == "CCLayer"
            -- set name = "layer" + "_" +tostr(item_count)
{{ CCLayer.rennder(data,name,parent) }}
        -- elif data.baseClass == "CCBFile"
            -- set name = "ccb" + "_" +tostr(item_count)
{{ CCBFile.rennder(data,name,parent,ccbdata) }}
        -- elif data.baseClass == "CCLabelTTF"
            -- set name = "ttf" + "_" +tostr(item_count)
{{ CCLabelTTF.rennder(data,name,parent) }}
        -- elif data.baseClass == "CCScale9Sprite"
            -- set name = "sprite9"+ "_" +tostr(item_count)
{{ CCScale9Sprite.rennder(data,name,parent) }}
        -- elif data.baseClass == "CCMenu"
            -- set name = "menu"+ "_" +tostr(item_count)
{{ CCMenu.rennder(data,name,parent) }}
        -- elif data.baseClass == "CCMenuItemImage"
            -- set name = "menuitemimage"+ "_" +tostr(item_count)
{{ CCMenuItemImage.rennder(data,name,parent) }}
        -- elif data.baseClass == "CCScrollView"
            -- set name = "scroll"+ "_" +tostr(item_count)
{{ CCScrollView.rennder(data,name,parent,ccbdata) }}
        -- elif data.baseClass == "CCControlButton"
            -- set name = "cccb"+ "_" +tostr(item_count)
{{ CCControlButton.rennder(data,name,parent,ccbdata) }}
        -- endif
{{'\t'}}{{parent}}:addChild({{name}})
{{'\n'}}
        -- set var_name = data.memberVarAssignmentName
        -- if not var_name or var_name == ""
            -- set var_name = data.displayName
            -- if not var_name or var_name.find("_") != 0
                -- set var_name = ""
            -- endif
        -- endif
        -- if var_name and var_name != ""
{{'\t'}}self.{{var_name}} = {{name}}
        -- endif
        -- if data.children
{{ rennder_tree(data,name) }}
        -- endif
    -- endfor
-- endmacro


{{'\n'}}
function {{ classname }}:ctor(_owner)
{{ CCNode.rennder_base_properties("self",data.properties,"nil") }}
{{ rennder_tree(data,"self") }}

end

return {{ classname }}