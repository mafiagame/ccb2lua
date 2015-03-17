-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,ccbdata)
	-- set prototype = ccbdata[data.properties.ccbFile]
	-- set classname = getCustomClass(prototype)
	-- if classname and classname != ""
{{'\t'}}local {{name}} = require("app.widgets.{{classname}}").new(_owner)
	-- else
{{'\t'}}local {{name}} = require("app.layout.{{prototype.class}}").new(_owner)
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 