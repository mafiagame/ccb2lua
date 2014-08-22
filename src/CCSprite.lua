-- import 'CCNode.lua' as CCNode



-- macro rennder(data,parent)

	-- if data.customClass and data.customClass != "" and data.customClass.find("on") != 0
{{'\t'}}local sprite = require("app.views.{{ data.customClass }}").new()
	-- else 
{{'\t'}}local sprite = display.newSprite()
	-- endif
	-- if data.customClass and data.customClass.find("on") == 0
{{'\t'}}CCBNodeExtend.touchSprite(sprite,handler(_owner, _owner.{{data.customClass}}),200)
	-- endif
{{ CCNode.rennder_base_properties("sprite",data.properties,parent) }}
{{'\t'}}{{parent}}:addChild(sprite)

-- endmacro 