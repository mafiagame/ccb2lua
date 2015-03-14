-- import 'CCNode.lua' as CCNode

-- macro rennder(data,name,parent,ccbdata)

-- if data.customClass and data.customClass != "" 
	-- if data.customClass == "AutoLayout"
{{'\t'}}local {{name}} = AutoLayout.new()
	-- else
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
	-- endif
-- else 
{{'\t'}}local {{name}} = CCScrollView:create()
-- endif

-- set item = data.properties.contentSize
	-- if item and item != ""
{{'\t'}}{{name}}:setViewSize(CCBNodeExtend.ccb_size({{item[0]}},{{item[1]}},{{item[2]}},{{parent}}))
	-- endif
-- set _ = nilProperty(data.properties,"contentSize")
-- set container = data.properties.container
-- if container and container != ""
	-- set prototype = ccbdata[container]
	-- set classname = getCustomClass(prototype)
	-- if classname == ""
{{'\t'}}{{name}}:setContainer(require("app.layout.{{prototype.class}}").new(_owner))
	-- else
{{'\t'}}{{name}}:setContainer(require("app.scenes.{{classname}}").new(_owner))
	-- endif
-- endif
-- set direction = data.properties.direction
-- if direction == "2"
{{'\t'}}{{name}}:setDirection(kCCScrollViewDirectionBoth)
-- elif direction == "1"
{{'\t'}}{{name}}:setDirection(kCCScrollViewDirectionVertical)
-- elif direction == "0"
{{'\t'}}{{name}}:setDirection(kCCScrollViewDirectionHorizontal)
-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 