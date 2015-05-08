-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define,ccbdata)
	-- set prototype = ccbdata[data.properties.ccbFile]
	-- set classname = getCustomClass(prototype)
	-- if classname and classname != ""
{{'\t'}}{{define}}{{name}} = require("app.widgets.{{classname}}").new(_owner)
	-- else
{{'\t'}}{{define}}{{name}} = require("app.layout.{{prototype.class|replace("/",".")}}").new(_owner)
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 
