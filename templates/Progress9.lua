-- import 'CCNode.lua' as CCNode

-- macro rennder(data,name,parent,define)
	-- set frame = data.properties.spriteFrame
	-- set size = data.properties.preferedSize
{{'\t'}}{{define}}{{name}} = Progress9.new("{{frame[1]}}",{{CCNode.rennder_size(size, parent)}})
	-- if not data.properties.anchorPoint
{{'\t'}}{{name}}:setAnchorPoint(cc.p(0,0))
	-- endif
{{'\t'}}{{CCNode.rennder_capinsets(name, data.properties)}}
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 
