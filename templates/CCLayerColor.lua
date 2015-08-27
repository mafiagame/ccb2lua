-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define)
    -- if data.customClass and data.customClass == "LayerColor"
		-- set color = data.properties.color
		-- set opacity = data.properties.opacity
		-- set _ = nilProperty(data.properties, "color")
		-- set _ = nilProperty(data.properties, "opacity")
{{'\t'}}{{define}}{{name}} = cc.LayerColor:create(cc.c4b({{color[0]}},{{color[1]}},{{color[2]}},{{opacity}}))
	-- else
		-- set _ = nilProperty(data.properties, "blendFunc")
{{'\t'}}{{define}}{{name}} = display.newNode()
	    -- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}{{CCNode.rennder_memberVarAssignment(name, data)}}	
		-- endif
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 