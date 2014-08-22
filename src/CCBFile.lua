-- import 'CCNode.lua' as CCNode



-- macro rennder(data,parent,ccbdata)
{{'\t'}}local ccb = require("app.layout.{{ccbdata[getProperty(data.properties,"ccbFile")].class}}").new()
{{ CCNode.rennder_base_properties("ccb",data.properties,parent) }}
{{'\t'}}{{parent}}:addChild(ccb)

-- endmacro 