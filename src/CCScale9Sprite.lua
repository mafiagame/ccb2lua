-- import 'CCNode.lua' as CCNode



-- macro rennder(data,parent)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local sprite9 = require("app.views.{{ data.customClass }}").new()
-- else
{{'\t'}}local sprite9 = CCScale9Sprite:create("{{getProperty(data.properties,"spriteFrame")[0]}}")
-- endif
{{'\t'}}sprite9:setCapInsets(CCBNodeExtend.cap_insets({{getProperty(data.properties,"insetLeft")}},{{getProperty(data.properties,"insetTop")}},{{getProperty(data.properties,"insetRight")}},{{getProperty(data.properties,"insetBottom")}}))
{{ CCNode.rennder_base_properties("sprite9",data.properties,parent) }}

{{'\t'}}{{parent}}:addChild(sprite9)

-- endmacro 