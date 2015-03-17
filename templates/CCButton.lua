-- import 'CCNode.lua' as CCNode


-- macro rennder(data,name,parent)
	-- if data.customClass and data.customClass == "UICheckBoxButton"
{{'\t'}}local {{name}} = cc.ui.UICheckBoxButton.new({
{{'\t'}}{{'\t'}}on = {{getDisplayFrameName(data.properties.normalSpriteFrame)}},
{{'\t'}}{{'\t'}}off = {{getDisplayFrameName(data.properties.selectedSpriteFrame)}}
		-- set disable = data.properties.disabledSpriteFrame
		-- if disable and disable != ""
{{'\t'}}{{'\t'}}on_disabled = {{getDisplayFrame(data.properties.disabledSpriteFrame)}},
{{'\t'}}{{'\t'}}off_disabled = {{getDisplayFrame(data.properties.disabledSpriteFrame)}},
		-- endif
{{'\t'}}})
	-- else
{{'\t'}}local {{name}} = cc.ui.UIPushButton.new({
{{'\t'}}{{'\t'}}normal = {{getDisplayFrame(data.properties.normalSpriteFrame)}},
{{'\t'}}{{'\t'}}pressed = {{getDisplayFrame(data.properties.selectedSpriteFrame)}},
		-- set disable = data.properties.disabledSpriteFrame
		-- if disable and disable != ""
{{'\t'}}{{'\t'}}disabled = {{getDisplayFrame(data.properties.disabledSpriteFrame)}},
		-- endif
{{'\t'}}})
	-- endif

	-- set block = data.properties.block
	-- if block and block[0]
{{'\t'}}:onButtonClicked({{getListener(block[1] == "1",block[0])}})
	-- endif

	-- if data.properties.isEnabled == "false"
{{'\t'}}{{name}}:setButtonEnabled(false)
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 