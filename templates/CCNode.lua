{% macro rennder_wh(value, parent) -%}
    {%- set w = value[0]|int -%}
    {%- set h = value[1]|int -%}

    {%- if parent == "nil" -%}
        {%- set parent = "display" -%}
    {%- else -%}
        {%- set parent = parent + ":getContentSize()" -%}
    {%- endif -%}

    {%- if value[2]|int == 4 -%}
        {%- set w = parent + ".width * " + tostr(w/100) -%}
        {%- set h = parent + ".height * " + tostr(h/100) -%}
    {%- elif value[2]|int == 1 -%}
        {%- set h = parent + ".height - " + tostr(h) -%} 
    {%- elif value[2]|int == 0 -%}{%- else -%}
    *************************************************
    ***   STOP RUNNING PROGRAM, WRONG ARGUMENT    ***
    *************************************************
    {%- endif -%}
    {{w}}, {{h}}
{%- endmacro %}

{% macro rennder_wh_size(value, parent) -%}
    {%- set w = value[0]|int -%}
    {%- set h = value[1]|int -%}

    {%- if parent == "nil" -%}
        {%- set parent = "display" -%}
    {%- else -%}
        {%- set parent = parent + ":getContentSize()" -%}
    {%- endif -%}

    {%- if value[2]|int == 1 -%}        
        {%- set w = parent + ".width * " + tostr(w/100) -%}
        {%- set h = parent + ".height * " + tostr(h/100) -%}
    {%- elif value[2]|int != 0 -%}
    *************************************************
    ***   STOP RUNNING PROGRAM, WRONG ARGUMENT    ***
    *************************************************
    {%- endif -%}
    {{w}}, {{h}}
{%- endmacro %}

{% macro rennder_size(value, parent) -%}
cc.size({{rennder_wh_size(value, parent)}})
{%- endmacro %}

{% macro rennder_pos(value, parent) -%}
cc.p({{rennder_wh(value, parent)}})
{%- endmacro %}

{% macro rennder_p2(value) -%}
cc.p({{value[0]}},{{value[0]}})
{%- endmacro %}

{% macro rennder_c4f(value) -%}
cc.c4f({{value[0]}},{{value[1]}},{{value[2]}},{{value[3]}})
{%- endmacro %}

{% macro rennder_texture(value) -%}
cc.Director:getInstance():getTextureCache():addImage("{{value}}")
{%- endmacro %}


{% macro rennder_memberVarAssignment(name, data) -%}
        {%- if data.memberVarAssignmentName == "BanTouch" -%}
ccbutils.banTouch({{name}})
        {%- else -%}
            {%- if data.memberVarAssignmentType == 0 -%}
{{name}}:addNodeEventListener(cc.NODE_EVENT,{{getListener(true, data.memberVarAssignmentName)}})
            {%- elif data.memberVarAssignmentType == 1 -%}
ccbutils.addTouchListener({{name}}, {{getListener(data.memberVarAssignmentType == 1, data.memberVarAssignmentName)}})
            {%- else -%}
ccbutils.addTouchListenerEx({{name}}, {{getListener(data.memberVarAssignmentType == 1, data.memberVarAssignmentName)}})
            {%- endif -%}
        {%- endif -%}
{%- endmacro %}

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



-- macro rennder_base_properties(name,properties,parent)
    -- for key in properties
        -- set value = properties[key]
        -- if checkPropertyInvalide(key, value)
            -- if key == "anchorPoint":
{{'\t'}}{{name}}:setAnchorPoint(cc.p({{value[0]}},{{value[1]}}))
        	--elif key == "position"
{{'\t'}}{{name}}:setPosition({{rennder_pos(value,parent)}})
        	--elif key == "scale"
                -- if value[0] == value[1]
{{'\t'}}{{name}}:setScale({{value[0]}})
                -- else
{{'\t'}}{{name}}:setScaleX({{value[0]}})
{{'\t'}}{{name}}:setScaleY({{value[1]}})
                -- endif
        	--elif key == "ignoreAnchorPointForPosition"
                -- if value
{{'\t'}}{{name}}:ignoreAnchorPointForPosition(true)
                -- else
{{'\t'}}{{name}}:ignoreAnchorPointForPosition(false)
                -- endif
    		--elif key == "displayFrame" and value[1] and value[1] != ""
{{'\t'}}{{name}}:setSpriteFrame({{getDisplayFrame2(value)}})
    		--elif key == "contentSize"
{{'\t'}}{{name}}:setContentSize({{rennder_size(value, parent)}})
            --elif key == "color"
{{'\t'}}{{name}}:setColor(cc.c3b({{value[0]}},{{value[1]}},{{value[2]}}))
            --elif key == "opacity"
{{'\t'}}{{name}}:setOpacity({{value}})
            --elif key == "tag"
{{'\t'}}{{name}}:setTag({{value}})
            --elif key == "rotation"
{{'\t'}}{{name}}:setRotation({{value}})
            --elif key == "skew"
                -- if value[0] != 0
{{'\t'}}{{name}}:setSkewX({{value[0]}})
                -- elif value[1] != 0
{{'\t'}}{{name}}:setSkewY({{value[1]}})
                -- endif
            --elif key == "visible"
            -- if value
{{'\t'}}{{name}}:setVisible(true)
            -- else
{{'\t'}}{{name}}:setVisible(false)
            -- endif
            --elif key == "blendFunc"
{{'\t'}}{{name}}:setBlendFunc({{value[0]}}, {{value[1]}})
            --endif
        -- endif
    -- endfor
-- endmacro


-- macro rennder(data,name,parent,define) 
    -- if data.customClass and data.customClass != ""
        -- if data.customClass == "BoxLayout"
{{'\t'}}{{define}}{{name}} = BoxLayout.new()
        -- else
{{'\t'}}{{define}}{{name}} = require("app.scenes.package.{{data.customClass}}").new()
        -- endif
    -- else
{{'\t'}}{{define}}{{name}} = display.newNode()
    -- endif
    -- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}{{rennder_memberVarAssignment(name, data)}}	
	-- endif
{{ rennder_base_properties(name,data.properties,parent) }}
-- endmacro
