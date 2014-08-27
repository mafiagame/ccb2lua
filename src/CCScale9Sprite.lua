-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)

	-- if data.customClass and data.customClass != "" and data.customClass.find("on") != 0
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
	-- else
		-- set frame = getProperty(data.properties,"spriteFrame")
		-- if frame[1]
{{'\t'}}local {{name}} = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("{{frame[1]}}", "{{frame[0]}}"))
		-- else
{{'\t'}}local {{name}} = CCScale9Sprite:create("{{frame[0]}}")
		-- endif
	-- endif
	-- if data.customClass and data.customClass.find("on") == 0
{{'\t'}}CCBNodeExtend.touchSprite({{name}}, self, _owner, "{{data.customClass}}")
	-- endif
	-- if not getProperty(data.properties,"anchorPoint")
{{'\t'}}{{name}}:setAnchorPoint(ccp(0,0))
	-- endif
{{'\t'}}CCBNodeExtend.cap_insets({{name}},{{getProperty(data.properties,"insetLeft")}},{{getProperty(data.properties,"insetTop")}},{{getProperty(data.properties,"insetRight")}},{{getProperty(data.properties,"insetBottom")}})
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 