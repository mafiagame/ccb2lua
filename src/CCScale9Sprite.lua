-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)

	-- if data.customClass and data.customClass != "" and data.customClass != "BanTouch" and data.customClass != "ProgressBar" and data.customClass != "EditBox"
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
	-- else
		-- set frame = getProperty(data.properties,"spriteFrame")
		-- if frame[1]
{{'\t'}}local {{name}} = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("{{frame[1]}}", "{{frame[0]}}"))
		-- else
{{'\t'}}local {{name}} = CCScale9Sprite:create("{{frame[0]}}")
		-- endif
	-- endif
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != "" and data.customClass != "EditBox"
		-- if data.memberVarAssignmentType == "1"
{{'\t'}}CCBNodeExtend.addTouchListener({{name}}, handler(_owner, assert(_owner.{{data.memberVarAssignmentName}},"{{data.memberVarAssignmentName}}")))
		-- else
{{'\t'}}CCBNodeExtend.addTouchListener({{name}}, handler(self, assert(self.{{data.memberVarAssignmentName}},"{{data.memberVarAssignmentName}}")))
		-- endif
	-- endif
	-- if not getProperty(data.properties,"anchorPoint")
{{'\t'}}{{name}}:setAnchorPoint(ccp(0,0))
	-- endif
{{'\t'}}CCBNodeExtend.cap_insets({{name}},{{getProperty(data.properties,"insetLeft")}},{{getProperty(data.properties,"insetTop")}},{{getProperty(data.properties,"insetRight")}},{{getProperty(data.properties,"insetBottom")}})
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
	-- if data.customClass == "BanTouch"
{{'\t'}}CCBNodeExtend.banTouch({{name}})
	-- elif data.customClass == "ProgressBar"
{{'\t'}}{{name}} = CCBNodeExtend.newProgressBar({{name}})
	-- elif data.customClass == "EditBox"
{{'\t'}}{{name}} = CCBNodeExtend.newEditBox({
{{'\t'}}{{'\t'}}scale9 = {{name}},
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
		-- if data.memberVarAssignmentType == "1"
{{'\t'}}{{'\t'}}listener = handler(_owner, assert(_owner.{{data.memberVarAssignmentName}},"{{data.memberVarAssignmentName}}")),
		-- else
{{'\t'}}{{'\t'}}listener = handler(self, assert(self.{{data.memberVarAssignmentName}},"{{data.memberVarAssignmentName}}")),
		-- endif
	-- endif
{{'\t'}}})
	-- endif
-- endmacro 
