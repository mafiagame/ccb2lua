-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define)

	-- set displayFrame = data.properties.displayFrame
	-- set _ = nilProperty(data.properties,"displayFrame")
	-- if data.customClass and data.customClass != ""
{{'\t'}}{{define}}{{name}} = require("app.scenes.package.{{data.customClass}}").new("{{displayFrame[1]}}")
	-- else
        -- if displayFrame[0] == None
{{'\t'}}{{define}}{{name}} = display.newSprite("{{displayFrame[1]}}")
        -- else
{{'\t'}}{{define}}{{name}} = display.newSprite(ccbutils.ccb_display_frame("{{displayFrame[1]}}", "{{displayFrame[0]}}"))
        -- endif
	-- endif
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}{{CCNode.rennder_memberVarAssignment(name, data)}}	
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro