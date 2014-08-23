-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
-- else
{{'\t'}}local {{name}} = CCScale9Sprite:create("{{getProperty(data.properties,"spriteFrame")[0]}}")
-- endif
-- if not getProperty(data.properties,"anchorPoint")
{{'\t'}}{{name}}:setAnchorPoint(ccp(0,0))
-- endif
{{'\t'}}CCBNodeExtend.cap_insets({{name}},{{getProperty(data.properties,"insetLeft")}},{{getProperty(data.properties,"insetTop")}},{{getProperty(data.properties,"insetRight")}},{{getProperty(data.properties,"insetBottom")}})
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 