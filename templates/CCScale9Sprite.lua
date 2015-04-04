-- import 'CCNode.lua' as CCNode

{% macro rennder_capinsets(name, value) -%}
	{% if value.insetLeft != 0 -%}
{{name}}:setInsetLeft({{value.insetLeft}});
    {%- endif -%}
	{% if value.insetTop != 0 -%}
{{name}}:setInsetTop({{value.insetTop}});
    {%- endif -%}
	{% if value.insetRight != 0 -%}
{{name}}:setInsetRight({{value.insetRight}});
    {%- endif -%}
	{% if value.insetBottom != 0 -%}
{{name}}:setInsetBottom({{value.insetBottom}});
    {%- endif -%}
{%- endmacro %}


-- macro rennder(data,name,parent,define)
	-- set frame = data.properties.spriteFrame
	-- if data.customClass and data.customClass != "" and data.customClass != "BanTouch" and data.customClass != "ProgressBar" and data.customClass != "EditBox"
{{'\t'}}{{define}}{{name}} = require("app.scenes.{{ data.customClass }}").new({{getDisplayFrame(frame)}})
	-- else
{{'\t'}}{{define}}{{name}} = display.newScale9Sprite("{{frame[1]}}")
	-- endif
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != "" and data.customClass != "EditBox"
{{'\t'}}{{CCNode.rennder_memberVarAssignment(name, data)}}
	-- endif
	-- if not data.properties.anchorPoint
{{'\t'}}{{name}}:setAnchorPoint(cc.p(0,0))
	-- endif
	-- set size = data.properties.preferedSize
	-- set tag = data.properties.tag
	-- if data.customClass == "EditBox"
		-- set _ = nilProperty(data.properties,"tag")
	-- else
{{'\t'}}{{name}}:setPreferredSize({{CCNode.rennder_size(size, parent)}})
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
	-- endif
{{'\t'}}{{rennder_capinsets(name, data.properties)}}
	-- if data.customClass == "EditBox"
{{'\t'}}{{name}} = cc.ui.UIInput.new({
{{'\t'}}{{'\t'}}image = {{name}},
{{'\t'}}{{'\t'}}size = {{CCNode.rennder_size(size, parent)}},
		-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}{{'\t'}}listener = {{getListener(data.memberVarAssignmentType == 1, data.memberVarAssignmentName)}},
		-- endif
{{'\t'}}})
		-- if tag and tag != -1
{{'\t'}}{{name}}:setFontSize({{tag}})
		-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
	-- endif
-- endmacro 
