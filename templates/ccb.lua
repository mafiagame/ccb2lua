
local {{ classname }} = class("{{ classname }}",function()
    return display.new{{ super }}()
end)

-- import 'CCNode.lua' as CCNode
-- import 'CCSprite.lua' as CCSprite
-- import 'CCLayerColor.lua' as CCLayerColor
-- import 'CCLayer.lua' as CCLayer
-- import 'CCBFile.lua' as CCBFile
-- import 'CCLabelTTF.lua' as CCLabelTTF
-- import 'CCLabelBMFont.lua' as CCLabelBMFont
-- import 'CCScale9Sprite.lua' as CCScale9Sprite
-- import 'CCMenu.lua' as CCMenu
-- import 'CCMenuItemImage.lua' as CCMenuItemImage
-- import 'CCButton.lua' as CCButton
-- import 'CCScrollView.lua' as CCScrollView
-- import 'CCControlButton.lua' as CCControlButton


-- macro rennder_tree(data,parent)
    -- for data in data.children
        -- set item_count = getIndex()
        -- set var_name = data.displayName
        -- set var_def = ""
        -- if var_name and var_name.find("_") == 0
            -- set var_def = ""
            -- set var_name = "self."+data.displayName
        -- else
            -- set var_def = "local "
            -- set var_name = data.baseClass.lower() + "_" + tostr(item_count)
        -- endif

        -- if data.baseClass == "CCNode"
{{ CCNode.rennder(data,var_name,parent,var_def) }}
        -- elif data.baseClass == "CCSprite"
{{ CCSprite.rennder(data,var_name,parent,var_def) }}
        -- elif data.baseClass == "CCLayerColor"
{{ CCLayerColor.rennder(data,var_name,parent,var_def) }}
        -- elif data.baseClass == "CCLayer"
{{ CCLayer.rennder(data,var_name,parent,var_def) }}
        -- elif data.baseClass == "CCBFile"
{{ CCBFile.rennder(data,var_name,parent,var_def,ccbdata) }}
        -- elif data.baseClass == "CCLabelTTF"
{{ CCLabelTTF.rennder(data,var_name,parent,var_def) }}
        -- elif data.baseClass == "CCLabelBMFont"
{{ CCLabelBMFont.rennder(data,var_name,parent,var_def) }}
        -- elif data.baseClass == "CCScale9Sprite"
{{ CCScale9Sprite.rennder(data,var_name,parent,var_def) }}
        -- elif data.baseClass == "CCMenu"
{{ CCNode.rennder(data,var_name,parent,var_def) }}
        -- elif data.baseClass == "CCMenuItemImage"
{{ CCButton.rennder(data,var_name,parent,var_def) }}
        -- elif data.baseClass == "CCScrollView"
{{ CCScrollView.rennder(data,var_name,parent,var_def,ccbdata) }}
        -- elif data.baseClass == "CCControlButton"
{{ CCControlButton.rennder(data,var_name,parent,var_def,ccbdata) }}
        -- endif
{{'\t'}}{{parent}}:addChild({{var_name}})
{{'\n'}}
        -- if data.children
{{ rennder_tree(data,var_name) }}
        -- endif
    -- endfor
-- endmacro


-- macro rennder_function(_function)
    -- for func in _function
function {{ classname }}:{{func}}(_tag, _sprite)
{{'\t'}}print("You should override this methed: <{{func}}>",_tag)
end
    -- endfor

-- endmacro

{{'\n'}}
function {{ classname }}:ctor(_owner)
{{'\t'}} _owner = _owner or self
{{CCNode.rennder_base_properties("self",data.properties,"nil") }}
{{rennder_tree(data,"self") }}
end

{{rennder_function(getFunction())}}

return {{ classname }}