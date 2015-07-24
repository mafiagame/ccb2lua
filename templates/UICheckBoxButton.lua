-- import 'CCNode.lua' as CCNode


-- macro rennder(data,name,parent,define,ccbdata)
{{'\t'}}{{define}}{{name}} = cc.ui.UICheckBoxButton.new({
	-- set var = data.properties["backgroundSpriteFrame|2"]
{{'\t'}}{{'\t'}}on = {{getDisplayFrameName(var)}},
	-- set var = data.properties["backgroundSpriteFrame|1"]
{{'\t'}}{{'\t'}}off = {{getDisplayFrameName(var)}},
{{'\t'}}},{scale9 = true})
{{'\t'}}:setButtonSize({{CCNode.rennder_wh_size(data.properties.preferedSize, parent)}})
	-- set block = data.properties.ccControl
	-- if block[0] != 0
{{'\t'}}:onButtonStateChanged({{getListener(block[1] == 1,block[0])}})
	-- endif

	-- if data.properties.enabled == "false"
{{'\t'}}{{name}}:setButtonEnabled(false)
	-- endif

{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 