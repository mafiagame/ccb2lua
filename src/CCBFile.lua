-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,ccbdata)
{{'\t'}}local {{name}} = require("app.layout.{{ccbdata[getProperty(data.properties,"ccbFile")].class}}").new()
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 