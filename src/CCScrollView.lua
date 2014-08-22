-- import 'CCNode.lua' as CCNode

-- macro rennder(data,parent,ccbdata)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local scroll = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}local scroll = CCScrollView:create()
-- endif

-- set container = getProperty(data.properties,"container")
-- if container and container != ""
{{'\t'}}scroll:setContainer(require("app.layout.{{ccbdata[container].class}}").new())
-- endif

-- set direction = getProperty(data.properties,"direction")
-- if direction == "2"
{{'\t'}}scroll:setDirection(kCCScrollViewDirectionBoth)
-- elif direction == "1"
{{'\t'}}scroll:setDirection(kCCScrollViewDirectionVertical)
-- elif direction == "0"
{{'\t'}}scroll:setDirection(kCCScrollViewDirectionHorizontal)
-- endif

{{ CCNode.rennder_base_properties("scroll",data.properties,parent) }}
{{'\t'}}{{parent}}:addChild(scroll)

-- endmacro 