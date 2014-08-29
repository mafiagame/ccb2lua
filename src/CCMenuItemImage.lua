-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)
	-- if data.customClass and data.customClass != "" 
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
	-- else 
{{'\t'}}local {{name}} = CCMenuItemImage:create()
	-- endif
	-- set var = getProperty(data.properties,"block")
	-- if var and var[0]
		-- if var[1] == "1"
{{'\t'}}{{name}}:registerScriptTapHandler(handler(_owner, assert(_owner.{{var[0]}},"{{var[0]}}")))
		-- else
{{'\t'}}{{name}}:registerScriptTapHandler(handler(self, assert(self.{{var[0]}},"{{var[0]}}")))
		-- endif
	-- endif
	-- set var = getProperty(data.properties,"normalSpriteFrame")
	-- if var
		-- if var[1]
{{'\t'}}{{name}}:setNormalSpriteFrame(CCBNodeExtend.ccb_display_frame("{{var[1]}}", "{{var[0]}}"))
		-- else
{{'\t'}}{{name}}:setNormalSpriteFrame(CCBNodeExtend.ccb_display_frame("{{var[0]}}"))
		-- endif
	-- endif
	-- set var = getProperty(data.properties,"selectedSpriteFrame")
	-- if var
		-- if var[1]
{{'\t'}}{{name}}:setSelectedSpriteFrame(CCBNodeExtend.ccb_display_frame("{{var[1]}}", "{{var[0]}}"))
		-- else
{{'\t'}}{{name}}:setSelectedSpriteFrame(CCBNodeExtend.ccb_display_frame("{{var[0]}}"))
		-- endif
	-- endif
	-- set var = getProperty(data.properties,"disabledSpriteFrame")
	-- if var
		-- if var[1]
{{'\t'}}{{name}}:setDisabledSpriteFrame(CCBNodeExtend.ccb_display_frame("{{var[1]}}", "{{var[0]}}"))
		-- else
{{'\t'}}{{name}}:setDisabledSpriteFrame(CCBNodeExtend.ccb_display_frame("{{var[0]}}"))
		-- endif
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 