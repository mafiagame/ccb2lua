-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}local {{name}} = CCMenu:create()
-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 