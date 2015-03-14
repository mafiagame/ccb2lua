-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)
	-- set frame = data.properties.spriteFrame
	-- if data.customClass and data.customClass != "" and data.customClass != "BanTouch" and data.customClass != "ProgressBar" and data.customClass != "EditBox"
{{'\t'}}local {{name}} = require("app.scenes.{{ data.customClass }}").new({{getDisplayFrame(frame)}})
	-- else
{{'\t'}}local {{name}} = CCScale9Sprite:createWithSpriteFrame({{getDisplayFrame(frame)}})
	-- endif
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != "" and data.customClass != "EditBox"
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
	-- if not data.properties.anchorPoint
{{'\t'}}{{name}}:setAnchorPoint(ccp(0,0))
	-- endif
{{'\t'}}CCBNodeExtend.cap_insets({{name}},{{data.properties.insetLeft}},{{data.properties.insetTop}},{{data.properties.insetRight}},{{data.properties.insetBottom}})
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
	-- if data.customClass == "BanTouch"
{{'\t'}}CCBNodeExtend.banTouch({{name}})
	-- elif data.customClass == "ProgressBar"
{{'\t'}}{{name}} = CCBNodeExtend.newProgressBar({{name}})
	-- elif data.customClass == "EditBox"
{{'\t'}}{{name}} = CCBNodeExtend.newEditBox({
{{'\t'}}{{'\t'}}scale9 = {{name}},
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}{{'\t'}}listener = {{getListener(data.memberVarAssignmentType == "1", data.memberVarAssignmentName)}},
	-- endif
{{'\t'}}})
	-- endif
-- endmacro 
