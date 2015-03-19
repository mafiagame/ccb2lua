-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define)

-- if data.customClass and data.customClass != "" 
{{'\t'}}{{define}}{{name}} = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}{{define}}{{name}} = CCMenu:create()
-- endif

--set size = data.properties.contentSize
-- if not size
{{'\t'}}{{name}}:setContentSize(cc.size(0,0))
-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 