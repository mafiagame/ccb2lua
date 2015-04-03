-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define)
	-- set frame = data.properties.spriteFrame
	-- if data.customClass and data.customClass != "" and data.customClass != "BanTouch" and data.customClass != "ProgressBar" and data.customClass != "EditBox"
{{'\t'}}{{define}}{{name}} = require("app.scenes.{{ data.customClass }}").new({{getDisplayFrame(frame)}})
	-- else
{{'\t'}}{{define}}{{name}} = display.newScale9Sprite("{{frame[1]}}")
	-- endif
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != "" and data.customClass != "EditBox"
		-- if data.memberVarAssignmentName == "BanTouch"
{{'\t'}}ccbutils.banTouch({{name}})
		-- else
			-- if data.memberVarAssignmentType == 0
{{'\t'}}{{name}}:addTouchListener({{getListener(true, data.memberVarAssignmentName)}})
			-- elif data.memberVarAssignmentType == 1
{{'\t'}}ccbutils.addTouchListener({{name}}, {{getListener(data.memberVarAssignmentType == 1, data.memberVarAssignmentName)}})
			-- else
{{'\t'}}ccbutils.addTouchListenerEx({{name}}, {{getListener(data.memberVarAssignmentType == 1, data.memberVarAssignmentName)}})
			-- endif
		-- endif
	-- endif
	-- if not data.properties.anchorPoint
{{'\t'}}{{name}}:setAnchorPoint(cc.p(0,0))
	-- endif
{{'\t'}}ccbutils.cap_insets({{name}},{{data.properties.insetLeft}},{{data.properties.insetTop}},{{data.properties.insetRight}},{{data.properties.insetBottom}})
	-- set size = data.properties.preferedSize
	-- set tag = data.properties.tag
	-- if data.customClass == "EditBox"
		-- set _ = nilProperty(data.properties,"tag")
	-- else
{{'\t'}}{{name}}:setPreferredSize({{CCNode.rennder_size(size, parent)}})
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
	-- endif
	-- if data.customClass == "BanTouch"
{{'\t'}}ccbutils.banTouch({{name}})
	-- elif data.customClass == "ProgressBar"
{{'\t'}}{{name}} = ccbutils.newProgressBar({{name}})
	-- elif data.customClass == "EditBox"
{{'\t'}}{{name}} = cc.ui.UIInput.new({
{{'\t'}}{{'\t'}}image = {{name}},
{{'\t'}}{{'\t'}}size = {{CCNode.rennder_size(size, parent)}},
		-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}{{'\t'}}listener = {{getListener(data.memberVarAssignmentType == 1, data.memberVarAssignmentName)}},
		-- endif
{{'\t'}}})
		-- if tag and tag != -1
{{'\t'}}{{name}}:setFontSize({{tag}})
		-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
	-- endif
-- endmacro 
