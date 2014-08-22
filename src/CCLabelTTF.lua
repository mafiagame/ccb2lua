-- import 'CCNode.lua' as CCNode



-- macro rennder(data,parent)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local ttf = require("app.views.{{ data.customClass }}").new()
-- else
{{'\t'}}local ttf = CCLabelTTF:create("{{getProperty(data.properties,"string")}}", "{{getProperty(data.properties,"fontName")}}", {{getProperty(data.properties,"fontSize")[0]}})
-- endif
{{ CCNode.rennder_base_properties("ttf",data.properties,parent) }}
{{'\t'}}{{parent}}:addChild(ttf)

-- endmacro 