-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local {{name}} = require("app.scenes.{{ data.customClass }}").new({
{{'\t'}}{{'\t'}}text = "{{serializeString(getProperty(data.properties,"string"))}}",
{{'\t'}}{{'\t'}}font = "{{getProperty(data.properties,"fontName")}}",
{{'\t'}}{{'\t'}}size = {{getProperty(data.properties,"fontSize")[0]}},
{{'\t'}}{{'\t'}}align = {{getProperty(data.properties,"horizontalAlignment")}},
{{'\t'}}{{'\t'}}valign = {{getProperty(data.properties,"verticalAlignment")}},
	-- set var = getProperty(data.properties, "dimensions")
	-- if var[0] != "0.0" or var[1] != "0.0"
{{'\t'}}{{'\t'}}dimensions = CCBNodeExtend.ccb_size({{var[0]}},{{var[1]}},{{var[2]}},{{parent}}),
	-- endif
{{'\t'}}})
-- else
	-- set var = getProperty(data.properties, "dimensions")
	-- if var[0] != "0.0" or var[1] != "0.0"
{{'\t'}}local {{name}} = CCLabelTTF:create("{{serializeString(getProperty(data.properties,"string"))}}","{{getProperty(data.properties,"fontName")}}", {{getProperty(data.properties,"fontSize")[0]}}, CCBNodeExtend.ccb_size({{var[0]}},{{var[1]}},{{var[2]}},{{parent}}), {{getProperty(data.properties, "horizontalAlignment")}}, {{getProperty(data.properties, "verticalAlignment")}})
	-- else
{{'\t'}}local {{name}} = CCLabelTTF:create("{{serializeString(getProperty(data.properties,"string"))}}", "{{getProperty(data.properties,"fontName")}}", {{getProperty(data.properties,"fontSize")[0]}})
	-- endif
-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 