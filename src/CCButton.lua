-- import 'CCNode.lua' as CCNode


-- macro rennder(data,name,parent)
{{'\t'}}local params = {
	-- set var = getProperty(data.properties,"normalSpriteFrame")
	-- if var[0] and var[0] != ""
		-- if var[1]
{{'\t'}}{{'\t'}}normal = CCBNodeExtend.ccb_display_frame("{{var[1]}}", "{{var[0]}}"),
		-- else
{{'\t'}}{{'\t'}}normal = CCBNodeExtend.ccb_display_frame("{{var[0]}}"),
		-- endif
	-- endif
	-- set var = getProperty(data.properties,"selectedSpriteFrame")
	-- if var[0] and var[0] != ""
		-- if var[1]
{{'\t'}}{{'\t'}}select = CCBNodeExtend.ccb_display_frame("{{var[1]}}", "{{var[0]}}"),
		-- else
{{'\t'}}{{'\t'}}select = CCBNodeExtend.ccb_display_frame("{{var[0]}}"),
		-- endif
	-- endif
	-- set var = getProperty(data.properties,"disabledSpriteFrame")
	-- if var[0] and var[0] != ""
		-- if var[1]
{{'\t'}}{{'\t'}}disable = CCBNodeExtend.ccb_display_frame("{{var[1]}}", "{{var[0]}}"),
		-- else
{{'\t'}}{{'\t'}}disable = CCBNodeExtend.ccb_display_frame("{{var[0]}}"),
		-- endif
	-- endif
	-- set var = getProperty(data.properties,"block")
	-- if var and var[0]
		-- if var[1] == "1"
{{'\t'}}{{'\t'}}listener = handler(_owner, assert(_owner.{{var[0]}},"{{var[0]}}"))
		-- else
{{'\t'}}{{'\t'}}listener = handler(self, assert(self.{{var[0]}},"{{var[0]}}"))
		-- endif
	-- endif
{{'\t'}}}
	-- if data.customClass and data.customClass != ""
		-- if data.customClass == "SwitchButton"
{{'\t'}}local {{name}} = CCBNodeExtend.newSwitchButton(params)
		-- else
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new(params)
		-- endif
	-- else
{{'\t'}}local {{name}} = CCBNodeExtend.newButton(params)
	-- endif
	-- set var = getProperty(data.properties,"isEnabled")
	-- if var == "false"
{{'\t'}}{{name}}:setEnabled(false)
	-- endif


{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 