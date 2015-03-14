-- import 'CCNode.lua' as CCNode


-- macro rennder(data,name,parent)
	-- set block = data.properties.block
	-- if data.customClass and data.customClass == "SwitchButton"
{{'\t'}}local {{name}} = cc.ui.UICheckBoxButton.new({on = {{getDisplayFrameName(data.properties.normalSpriteFrame)}},off = {{getDisplayFrameName(data.properties.selectedSpriteFrame)}}})
		-- if block and block[0]
{{'\t'}}{{name}}:onButtonClicked({{getListener(block[1] == "1",block[0])}})
		-- endif
		-- if data.properties.isEnabled == "false"
{{'\t'}}{{name}}:setButtonEnabled(false)
		-- endif
	-- else
{{'\t'}}local params = {
{{'\t'}}{{'\t'}}normal = {{getDisplayFrame(data.properties.normalSpriteFrame)}},
{{'\t'}}{{'\t'}}select = {{getDisplayFrame(data.properties.selectedSpriteFrame)}},
{{'\t'}}{{'\t'}}disable = {{getDisplayFrame(data.properties.disabledSpriteFrame)}},
		-- if block and block[0]
{{'\t'}}{{'\t'}}listener = {{getListener(block[1] == "1",block[0])}},
		-- endif
{{'\t'}}}
		-- if data.customClass and data.customClass != ""
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new(params)
		-- else
{{'\t'}}local {{name}} = CCBNodeExtend.newButton(params)
		-- endif
		-- if data.properties.isEnabled == "false"
{{'\t'}}{{name}}:setEnabled(false)
		-- endif
	
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 