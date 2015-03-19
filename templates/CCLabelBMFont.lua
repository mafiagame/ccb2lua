-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define)
{{'\t'}}{{define}}{{name}} = display.newBMFontLabel({
{{'\t'}}{{'\t'}}text = "{{serializeString(data.properties.string)}}",
{{'\t'}}{{'\t'}}font = "{{data.properties.fntFile}}",
{{'\t'}}})
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 