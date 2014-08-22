-- import 'CCNode.lua' as CCNode



-- macro rennder(data,parent)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local mask = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}local mask = CCLayerColor:create()
-- endif
{{ CCNode.rennder_base_properties("mask",data.properties,parent) }}
{{'\t'}}{{parent}}:addChild(mask)

-- endmacro 