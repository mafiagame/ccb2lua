-- import 'CCNode.lua' as CCNode

-- macro rennder(data,name,parent,ccbdata)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}local {{name}} = CCScrollView:create()
-- endif
-- set container = getProperty(data.properties,"container")
-- if container and container != ""
{{'\t'}}{{name}}:setContainer(require("app.layout.{{ccbdata[container].class}}").new())
-- endif
-- set direction = getProperty(data.properties,"direction")
-- if direction == "2"
{{'\t'}}{{name}}:setDirection(kCCScrollViewDirectionBoth)
-- elif direction == "1"
{{'\t'}}{{name}}:setDirection(kCCScrollViewDirectionVertical)
-- elif direction == "0"
{{'\t'}}{{name}}:setDirection(kCCScrollViewDirectionHorizontal)
-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 