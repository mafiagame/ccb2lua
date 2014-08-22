-- import 'CCNode.lua' as CCNode



-- macro rennder(data,parent)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local menuitemimage = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}local menuitemimage = CCMenuItemImage:create()
-- endif
-- set name = getProperty(data.properties,"block")[0]
{{'\t'}}CCBNodeExtend.addListener(menuitemimage, handler(_owner, _owner.{{name}}))
-- set name = getProperty(data.properties,"normalSpriteFrame")
-- if name
	-- if name[1]
{{'\t'}}menuitemimage:setNormalSpriteFrame(CCBNodeExtend.ccb_display_frame("{{name[1]}}", "{{name[0]}}"))
	-- else
{{'\t'}}menuitemimage:setNormalSpriteFrame(CCBNodeExtend.ccb_display_frame("{{name[0]}}"))
	-- endif
-- endif
-- set name = getProperty(data.properties,"selectedSpriteFrame")
-- if name
	-- if name[1]
{{'\t'}}menuitemimage:setSelectedSpriteFrame(CCBNodeExtend.ccb_display_frame("{{name[1]}}", "{{name[0]}}"))
	-- else
{{'\t'}}menuitemimage:setSelectedSpriteFrame(CCBNodeExtend.ccb_display_frame("{{name[0]}}"))
	-- endif
-- endif
-- set name = getProperty(data.properties,"disabledSpriteFrame")
-- if name
	-- if name[1]
{{'\t'}}menuitemimage:setDisabledSpriteFrame(CCBNodeExtend.ccb_display_frame("{{name[1]}}", "{{name[0]}}"))
	-- else
{{'\t'}}menuitemimage:setDisabledSpriteFrame(CCBNodeExtend.ccb_display_frame("{{name[0]}}"))
	-- endif
-- endif
{{ CCNode.rennder_base_properties("menuitemimage",data.properties,parent) }}
{{'\t'}}{{parent}}:addChild(menuitemimage)

-- endmacro 