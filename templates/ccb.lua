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
-- import 'CCScrollView.lua' as CCScrollView
-- import 'CCControlButton.lua' as CCControlButton
-- import 'CCParticleSystemQuad.lua' as CCParticleSystemQuad
-- import 'AutoLayout.lua' as AutoLayout
-- import 'RichLabel.lua' as RichLabel
-- import 'Progress9.lua' as Progress9
-- import 'UIListView.lua' as UIListView
-- import 'UISlider.lua' as UISlider
-- import 'UICheckBoxButton.lua' as UICheckBoxButton


{% macro rennder_tree(data,parent) -%}
    {%- for data in data.children -%}
        {%- set item_count = getIndex() -%}
        {%- set var_name = data.displayName -%}
        {%- set var_def = "" -%}
        {%- if var_name and var_name.find("_") == 0 -%}
            {%- set var_def = "" -%}
            {%- set var_name = "self."+data.displayName -%}
        {%- else -%}
            {%- set var_def = "local " -%}
            {%- set var_name = data.baseClass.lower() + "_" + tostr(item_count) -%}
        {%- endif -%}

        {%- if data.customClass == "UICheckBoxButton" -%}
{{ UICheckBoxButton.rennder(data,var_name,parent,var_def,ccbdata) }}
        {%- elif data.customClass == "UISlider" -%}
{{ UISlider.rennder(data,var_name,parent,var_def) }}
        {%- elif data.customClass == "UIListView" -%}
{{ UIListView.rennder(data,var_name,parent,var_def,ccbdata) }}
        {%- elif data.customClass == "AutoLayout" -%}
{{ AutoLayout.rennder(data,var_name,parent,var_def,ccbdata) }}
        {%- elif data.customClass == "Progress9" and data.baseClass == "CCScale9Sprite" -%}
{{ Progress9.rennder(data,var_name,parent,var_def) }}
        {%- elif data.customClass == "RichLabel" -%}
{{ RichLabel.rennder(data,var_name,parent,var_def) }}
        {%- elif data.baseClass == "CCNode" -%}
{{ CCNode.rennder(data,var_name,parent,var_def) }}
        {%- elif data.baseClass == "CCSprite" -%}
{{ CCSprite.rennder(data,var_name,parent,var_def) }}
        {%- elif data.baseClass == "CCLayerColor" -%}
{{ CCLayerColor.rennder(data,var_name,parent,var_def) }}
        {%- elif data.baseClass == "CCLayer" -%}
{{ CCLayer.rennder(data,var_name,parent,var_def) }}
        {%- elif data.baseClass == "CCBFile" -%}
{{ CCBFile.rennder(data,var_name,parent,var_def,ccbdata) }}
        {%- elif data.baseClass == "CCLabelTTF" -%}
{{ CCLabelTTF.rennder(data,var_name,parent,var_def) }}
        {%- elif data.baseClass == "CCLabelBMFont" -%}
{{ CCLabelBMFont.rennder(data,var_name,parent,var_def) }}
        {%- elif data.baseClass == "CCScale9Sprite" -%}
{{ CCScale9Sprite.rennder(data,var_name,parent,var_def) }}
        {%- elif data.baseClass == "CCMenu" -%}
{{ CCNode.rennder(data,var_name,parent,var_def) }}
        {%- elif data.baseClass == "CCMenuItemImage" -%}
{{ CCMenuItemImage.rennder(data,var_name,parent,var_def) }}
        {%- elif data.baseClass == "CCScrollView" -%}
{{ CCScrollView.rennder(data,var_name,parent,var_def,ccbdata) }}
        {%- elif data.baseClass == "CCControlButton" -%}
{{ CCControlButton.rennder(data,var_name,parent,var_def,ccbdata) }}
        {%- elif data.baseClass == "CCParticleSystemQuad" -%}
{{ CCParticleSystemQuad.rennder(data,var_name,parent,var_def) }}
        {%- endif -%}
{{'\t'}}{{parent}}:addChild({{var_name}})
{{'\n'}}
        {%- if data.children and not data.ignoreRenderChilden -%}
{{ rennder_tree(data,var_name) }}
        {%- endif -%}
    {%- endfor -%}
{%- endmacro %}

-- macro rennder_function(_function)
    -- for func in _function
function {{ real_classname }}:{{func}}(_params)
{{'\t'}}print("You should override this methed: <{{ real_classname }}:{{func}}>",_params.tag, _params.target)
end
    -- endfor
-- endmacro

-- set real_classname = classname|replace("/","_")
local {{ real_classname }} = class("{{ real_classname }}",function()
    return display.new{{ super }}()
end)

-- set size = data.properties.contentSize
-- if size
{{real_classname}}.designSize = {{CCNode.rennder_size(size,"nil")}}
-- endif


{{'\n'}}
function {{ real_classname }}:ctor(_owner)
{{'\t'}} _owner = _owner or self
{{CCNode.rennder_base_properties("self",data.properties,"nil") }}
    {%- if data.memberVarAssignmentName and data.memberVarAssignmentName != "" -%}
{{'\t'}}{{CCNode.rennder_memberVarAssignment("self", data)}} 
    {%- endif -%}
{{'\n'}}   
{{rennder_tree(data,"self") }}
end

{{rennder_function(getFunction())}}

return {{ real_classname }}