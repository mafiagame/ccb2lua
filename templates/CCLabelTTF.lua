-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)
-- set properties = data.properties
-- if data.customClass and data.customClass != "" 
{{'\t'}}local {{name}} = require("app.scenes.{{ data.customClass }}").new({
{{'\t'}}{{'\t'}}text = "{{serializeString(properties.string)}}",
{{'\t'}}{{'\t'}}font = "{{properties.fontName}}",
{{'\t'}}{{'\t'}}size = {{properties.fontSize[0]}},
{{'\t'}}{{'\t'}}align = {{properties.horizontalAlignment}},
{{'\t'}}{{'\t'}}valign = {{properties.verticalAlignment}},
{{'\t'}}{{'\t'}}tag = {{properties.tag}},
	-- set var = properties.dimensions
	-- if var[0] != "0.0" or var[1] != "0.0"
{{'\t'}}{{'\t'}}dimensions = CCBNodeExtend.ccb_size({{var[0]}},{{var[1]}},{{var[2]}},{{parent}}),
	-- endif
{{'\t'}}})
-- else
	-- set var = properties.dimensions
	-- if var[0] != "0.0" or var[1] != "0.0"
{{'\t'}}local {{name}} = CCLabelTTF:create("{{serializeString(properties.string)}}","{{properties.fontName}}", {{properties.fontSize[0]}}, CCBNodeExtend.ccb_size({{var[0]}},{{var[1]}},{{var[2]}},{{parent}}), {{properties.horizontalAlignment}}, {{properties.verticalAlignment}})
	-- else
{{'\t'}}local {{name}} = CCLabelTTF:create("{{serializeString(properties.string)}}", "{{properties.fontName}}", {{properties.fontSize[0]}})
	-- endif
-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 