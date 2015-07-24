-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define)
-- set properties = data.properties
-- if data.customClass and data.customClass == "UIInput" 
{{'\t'}}{{define}}{{name}} = cc.ui.UIInput.new({
{{'\t'}}{{'\t'}}x=0,
{{'\t'}}{{'\t'}}y=0,
{{'\t'}}{{'\t'}}UIInputType = 2,
{{'\t'}}{{'\t'}}text = "{{serializeString(properties.string)}}",
{{'\t'}}{{'\t'}}font = "{{properties.fontName}}",
{{'\t'}}{{'\t'}}fontSize = {{properties.fontSize[0]}},
	-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}{{'\t'}}listener = {{getListener("_owner",data.memberVarAssignmentName)}},
	-- endif

	-- set var = properties.tag
	-- if var and var != ""
{{'\t'}}{{'\t'}}maxLength = {{properties.tag}},
	-- endif
{{'\t'}}})
-- else
{{'\t'}}{{define}}{{name}} = display.newTTFLabel({
{{'\t'}}{{'\t'}}text = "{{serializeString(properties.string)}}",
{{'\t'}}{{'\t'}}font = "{{properties.fontName}}",
{{'\t'}}{{'\t'}}size = {{properties.fontSize[0]}},
	-- set var = properties.tag
	-- if var and var != ""
{{'\t'}}{{'\t'}}tag = {{properties.tag}},
	-- endif
	-- set var = properties.dimensions
	-- if var[0] != 0 or var[1] != 0
{{'\t'}}{{'\t'}}align = {{properties.horizontalAlignment}},
{{'\t'}}{{'\t'}}valign = {{properties.verticalAlignment}},
{{'\t'}}{{'\t'}}dimensions = cc.size({{CCNode.rennder_size(var, parent)}}.width,0),
	-- endif
{{'\t'}}})
-- endif

{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 