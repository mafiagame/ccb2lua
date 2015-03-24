-- import 'CCNode.lua' as CCNode

-- macro rennder(data,name,parent,define,ccbdata)

{{'\t'}}{{define}}{{name}} = cc.ScrollView:create()

-- set item = data.properties.contentSize
	-- if item and item != ""
{{'\t'}}{{name}}:setViewSize(ccbutils.ccb_size({{item[0]}},{{item[1]}},{{item[2]}},{{parent}}))
	-- endif
-- set _ = nilProperty(data.properties,"contentSize")
-- set container = data.properties.container
-- if container and container != ""
	-- set prototype = ccbdata[container]
	-- set classname = getCustomClass(prototype)
	-- if classname == ""
{{'\t'}}{{name}}:setContainer(require("app.layout.{{prototype.class}}").new(_owner))
	-- else
{{'\t'}}{{name}}:setContainer(require("app.widgets.{{classname}}").new(_owner))
	-- endif
-- endif
-- set direction = data.properties.direction
-- if direction == "2"
{{'\t'}}{{name}}:setDirection(cc.SCROLLVIEW_DIRECTION_BOTH)
-- elif direction == "1"
{{'\t'}}{{name}}:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
-- elif direction == "0"
{{'\t'}}{{name}}:setDirection(cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 