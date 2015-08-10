-- import 'CCNode.lua' as CCNode


{% macro rennder_auto_size(size, pos) -%}
    {%- set w = size[0]|int -%}
    {%- set h = size[1]|int -%}
    {%- set y = pos[1]|int -%}
    {%- set height = 1334 -%}
    {%- set h = height - h - y -%}
cc.size({{w}}, display.height - {{h}} - {{y}})
{%- endmacro %}

-- macro rennder(data,name,parent,define,ccbdata)
-- if data.customProperties
	-- set _=debug(data)
-- endif

{% if data.customProperties and data.customProperties.DropRefresh == "1" -%}
{{'\t'}}{{define}}{{name}} = DropRefreshLayout.new()
{% else -%}
{{'\t'}}{{define}}{{name}} = AutoLayout.new()
{% endif -%}

-- set item = data.properties.contentSize
	-- if item and item != ""
		-- if data.customProperties and data.customProperties.AutoSize == "1"
{{'\t'}}{{name}}:setViewSize({{rennder_auto_size(item, data.properties.position)}})
		-- else
{{'\t'}}{{name}}:setViewSize({{CCNode.rennder_size(item, parent)}})
		-- endif
	-- endif
-- set _ = nilProperty(data.properties,"contentSize")
-- set container = data.properties.container
-- if container and container != ""
	-- set prototype = ccbdata[container]
	-- set classname = getCustomClass(prototype)
	-- if classname == ""
{{'\t'}}{{name}}:setContainer(require("app.layout.{{prototype.class}}").new(_owner))
	-- else
{{'\t'}}{{name}}:setContainer(require("app.widgets.{{classname}}").new(_owner))
	-- endif
-- endif
-- set direction = data.properties.direction
-- if direction == 2
{{'\t'}}{{name}}:setDirection(cc.ui.UIScrollView.DIRECTION_BOTH)
-- elif direction == 1
{{'\t'}}{{name}}:setDirection(cc.ui.UIScrollView.DIRECTION_VERTICAL)
-- elif direction == 0
{{'\t'}}{{name}}:setDirection(cc.ui.UIScrollView.DIRECTION_HORIZONTAL)
-- endif
-- if data.customProperties and data.customProperties.SizeSuit == "1"
{{'\t'}}{{name}}:setSizeSuitEnable(true)
-- endif

{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 