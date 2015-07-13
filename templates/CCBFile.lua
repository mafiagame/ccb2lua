-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define,ccbdata)
	-- set prototype = ccbdata[data.properties.ccbFile]
	-- if prototype
		-- set classname = getCustomClass(prototype)
		-- if classname and classname != ""
{{'\t'}}{{define}}{{name}} = require("app.scenes.package.{{classname}}").new()
		-- else
{{'\t'}}{{define}}{{name}} = require("app.layout.{{prototype.class|replace("/",".")}}").new(_owner)
		-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
	-- endif
-- endmacro 
