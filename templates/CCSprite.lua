-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)
	-- if data.customClass and data.customClass != ""
{{'\t'}}local {{name}} = require("app.scenes.{{ data.customClass }}").new()
	-- else
		-- set displayFrame = data.properties.displayFrame
{{'\t'}}local {{name}} = display.newSprite("{{displayFrame[0]}}")
		-- set _ = nilProperty(data.properties,"displayFrame")
	-- endif
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
		-- if data.memberVarAssignmentName == "BanTouch"
{{'\t'}}CCBNodeExtend.banTouch({{name}})
		-- else
			-- if data.memberVarAssignmentType == "0"
{{'\t'}}{{name}}:addTouchListener({{getListener(true, data.memberVarAssignmentName)}})
			-- elif data.memberVarAssignmentType == "1"
{{'\t'}}CCBNodeExtend.addTouchListener({{name}}, {{getListener(data.memberVarAssignmentType == "1", data.memberVarAssignmentName)}})
			-- else
{{'\t'}}CCBNodeExtend.addTouchListenerEx({{name}}, {{getListener(data.memberVarAssignmentType == "1", data.memberVarAssignmentName)}})
			-- endif
		-- endif
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 