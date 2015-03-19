-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define)

-- if data.customClass and data.customClass != "" 
{{'\t'}}{{define}}{{name}} = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}{{define}}{{name}} = display.newLayer()
-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 