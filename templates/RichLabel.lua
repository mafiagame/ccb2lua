-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define)
	-- set properties = data.properties
{{'\t'}}{{define}}{{name}} = RichLabel.new({
{{'\t'}}{{'\t'}}fontName = "{{properties.fontName}}",
	-- set var = properties.color
	-- if var
{{'\t'}}{{'\t'}}fontColor = cc.c3b({{var[0]}},{{var[1]}},{{var[2]}}),
		-- set _ = nilProperty(data.properties, "color")
	-- endif
{{'\t'}}{{'\t'}}fontSize = {{properties.fontSize[0]}},
	-- set var = properties.dimensions
	-- if var[0] != 0 or var[1] != 0
{{'\t'}}{{'\t'}}maxWidth = {{CCNode.rennder_size(var, parent)}}.width,
	-- endif
{{'\t'}}})
{{'\t'}}{{name}}:setString("{{serializeString(properties.string)}}")
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro