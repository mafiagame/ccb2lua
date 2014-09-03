-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)

	-- if data.customClass and data.customClass != ""
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
	-- else
		-- set frame = getProperty(data.properties,"spriteFrame")
		-- if frame[1]
{{'\t'}}local {{name}} = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("{{frame[1]}}", "{{frame[0]}}"))
		-- else
{{'\t'}}local {{name}} = CCScale9Sprite:create("{{frame[0]}}")
		-- endif
	-- endif
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
		-- if data.memberVarAssignmentType == "1"
{{'\t'}}CCBNodeExtend.addTouchListener({{name}}, handler(_owner, assert(_owner.{{data.memberVarAssignmentName}},"{{data.memberVarAssignmentName}}")))
		-- else
{{'\t'}}CCBNodeExtend.addTouchListener({{name}}, handler(self, assert(self.{{data.memberVarAssignmentName}},"{{data.memberVarAssignmentName}}")))
		-- endif
	-- endif
	-- if not getProperty(data.properties,"anchorPoint")
{{'\t'}}{{name}}:setAnchorPoint(ccp(0,0))
	-- endif
	-- if data.displayName and data.displayName.find("banTouch") != -1
{{'\t'}}CCBNodeExtend.banTouch({{name}})
	-- endif
{{'\t'}}CCBNodeExtend.cap_insets({{name}},{{getProperty(data.properties,"insetLeft")}},{{getProperty(data.properties,"insetTop")}},{{getProperty(data.properties,"insetRight")}},{{getProperty(data.properties,"insetBottom")}})
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 
