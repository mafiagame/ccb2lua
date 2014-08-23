-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,ccbdata)
	-- set prototype = ccbdata[getProperty(data.properties,"ccbFile")]
	-- set classname = getCustomClass(prototype)

	-- if classname == ""
{{'\t'}}local {{name}} = require("app.layout.{{prototype.class}}").new()
	-- else
{{'\t'}}local {{name}} = require("app.scenes.{{classname}}").new()
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 