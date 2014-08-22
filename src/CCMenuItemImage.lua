-- import 'CCNode.lua' as CCNode



-- macro rennder(data,parent)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local menuitemimage = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}local menuitemimage = ui.newImageMenuItem({
-- set name = getProperty(data.properties,"normalSpriteFrame")[0]
-- if name and name != ""
{{'\t'}}{{'\t'}}image = "{{name}}",
-- endif
-- set name = getProperty(data.properties,"selectedSpriteFrame")[0]
-- if name and name != ""
{{'\t'}}{{'\t'}}imageSelected = "{{name}}",
-- endif
-- set name = getProperty(data.properties,"disabledSpriteFrame")[0]
-- if name and name != ""
{{'\t'}}{{'\t'}}imageDisabled = "{{name}}",
-- endif
-- set name = getProperty(data.properties,"block")[0]
-- if name and name != ""
{{'\t'}}{{'\t'}}listener = handler(_owner, _owner.{{name}}),
-- endif
{{'\t'}}})
-- endif
{{ CCNode.rennder_base_properties("menuitemimage",data.properties,parent) }}
{{'\t'}}{{parent}}:addChild(menuitemimage)

-- endmacro 