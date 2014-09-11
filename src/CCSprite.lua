-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)
	-- if data.customClass and data.customClass != ""
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
	-- else 
{{'\t'}}local {{name}} = display.newSprite()
	-- endif
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
		-- if data.memberVarAssignmentType == "1"
{{'\t'}}CCBNodeExtend.addTouchListener({{name}}, handler(_owner, assert(_owner.{{data.memberVarAssignmentName}},"{{data.memberVarAssignmentName}}")))
		-- else
{{'\t'}}CCBNodeExtend.addTouchListener({{name}}, handler(self, assert(self.{{data.memberVarAssignmentName}},"{{data.memberVarAssignmentName}}")))
		-- endif
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 