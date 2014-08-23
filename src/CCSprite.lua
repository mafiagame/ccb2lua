-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)
	-- if data.customClass and data.customClass != "" and data.customClass.find("on") != 0
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
	-- else 
{{'\t'}}local {{name}} = display.newSprite()
	-- endif
	-- if data.customClass and data.customClass.find("on") == 0
{{'\t'}}CCBNodeExtend.touchSprite({{name}}, self, _owner, "{{data.customClass}}")
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 