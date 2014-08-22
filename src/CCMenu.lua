-- import 'CCNode.lua' as CCNode



-- macro rennder(data,parent)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local menu = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}local menu = CCMenu:create()
-- endif
{{ CCNode.rennder_base_properties("menu",data.properties,parent) }}
{{'\t'}}{{parent}}:addChild(menu)

-- endmacro 