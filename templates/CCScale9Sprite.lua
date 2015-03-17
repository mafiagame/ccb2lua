-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)
	-- set frame = data.properties.spriteFrame
	-- if data.customClass and data.customClass != "" and data.customClass != "BanTouch" and data.customClass != "ProgressBar" and data.customClass != "EditBox"
{{'\t'}}local {{name}} = require("app.scenes.{{ data.customClass }}").new({{getDisplayFrame(frame)}})
	-- else
{{'\t'}}local {{name}} = display.newScale9Sprite("{{frame[0]}}")
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
{{'\t'}}{{name}}:setAnchorPoint(cc.p(0,0))
	-- endif
{{'\t'}}CCBNodeExtend.cap_insets({{name}},{{data.properties.insetLeft}},{{data.properties.insetTop}},{{data.properties.insetRight}},{{data.properties.insetBottom}})
	-- set size = data.properties.preferedSize
	-- set tag = data.properties.tag
	-- if data.customClass == "EditBox"
		-- set _ = nilProperty(data.properties,"preferedSize")
		-- set _ = nilProperty(data.properties,"tag")
	-- else
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
	-- endif
	-- if data.customClass == "BanTouch"
{{'\t'}}CCBNodeExtend.banTouch({{name}})
	-- elif data.customClass == "ProgressBar"
{{'\t'}}{{name}} = CCBNodeExtend.newProgressBar({{name}})
	-- elif data.customClass == "EditBox"
{{'\t'}}{{name}} = cc.ui.UIInput.new({
{{'\t'}}{{'\t'}}image = {{name}},
{{'\t'}}{{'\t'}}size = CCBNodeExtend.ccb_size({{size[0]}},{{size[1]}},{{size[2]}},{{parent}}),
		-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}{{'\t'}}listener = {{getListener(data.memberVarAssignmentType == "1", data.memberVarAssignmentName)}},
		-- endif
{{'\t'}}})
		-- if tag and tag != -1
{{'\t'}}{{name}}:setFontSize({{tag}})
		-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
	-- endif
-- endmacro 
