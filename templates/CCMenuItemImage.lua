-- import 'CCNode.lua' as CCNode


-- macro rennder(data,name,parent,define)
	-- if data.customClass and data.customClass != "" 
{{'\t'}}{{define}}{{name}} = require("app.views.{{ data.customClass }}").new()
	-- else 
{{'\t'}}{{define}}{{name}} = CCMenuItemImage:create()
	-- endif
	-- set var = data.properties.block
	-- if var and var[0]
{{'\t'}}{{name}}:registerScriptTapHandler({{getListener(var[1] == "1", var[0])}})
	-- endif
	-- set var = data.properties.normalSpriteFrame
	-- if var
{{'\t'}}{{name}}:setNormalSpriteFrame({{getListener(var[1] == "1", var[0])}})
	-- endif
	-- set var = data.properties.selectedSpriteFrame
	-- if var
{{'\t'}}{{name}}:setSelectedSpriteFrame({{getListener(var[1] == "1", var[0])}})
	-- endif
	-- set var = data.properties.disabledSpriteFrame
	-- if var
{{'\t'}}{{name}}:setDisabledSpriteFrame({{getListener(var[1] == "1", var[0])}})
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 