-- import 'CCNode.lua' as CCNode



-- macro rennder(data,parent)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local layer = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}local layer = display.newLayer()
-- endif
{{ CCNode.rennder_base_properties("layer",data.properties,parent) }}
{{'\t'}}{{parent}}:addChild(layer)

-- endmacro 