-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define)
	-- if data.customClass and data.customClass != ""
{{'\t'}}{{define}}{{name}} = require("app.scenes.{{ data.customClass }}").new()
	-- else
		-- set displayFrame = data.properties.displayFrame
{{'\t'}}{{define}}{{name}} = display.newSprite("{{displayFrame[1]}}")
		-- set _ = nilProperty(data.properties,"displayFrame")
	-- endif
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}{{CCNode.rennder_memberVarAssignment(name, data)}}	
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 