-- import 'CCNode.lua' as CCNode



#-- if var[1] == "1"
#{{'\t'}}{{name}}:addHandleOfControlEvent({{getListener(var[1] == "1", var[0])}},CCControlEventTouchDown)
#{{'\t'}}{{name}}:addHandleOfControlEvent({{getListener(var[1] == "1", var[0])}},CCControlEventTouchDragInside)
#{{'\t'}}{{name}}:addHandleOfControlEvent({{getListener(var[1] == "1", var[0])}},CCControlEventTouchDragOutside)
#{{'\t'}}{{name}}:addHandleOfControlEvent({{getListener(var[1] == "1", var[0])}},CCControlEventTouchDragEnter)
#{{'\t'}}{{name}}:addHandleOfControlEvent({{getListener(var[1] == "1", var[0])}},CCControlEventTouchDragExit)
#{{'\t'}}{{name}}:addHandleOfControlEvent({{getListener(var[1] == "1", var[0])}},CCControlEventTouchUpInside)
#{{'\t'}}{{name}}:addHandleOfControlEvent({{getListener(var[1] == "1", var[0])}},CCControlEventTouchUpOutside)
#{{'\t'}}{{name}}:addHandleOfControlEvent({{getListener(var[1] == "1", var[0])}},CCControlEventTouchCancel)
#-- endif




-- macro rennder(data,name,parent,ccbdata)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local {{name}} = require("app.scenes.{{ data.customClass }}").new()
-- else 
{{'\t'}}local {{name}} = CCControlButton:create()
-- endif

-- set state = ""
-- for x in range(1,4)
	-- if x == 1
		-- set state = "CCControlStateNormal"
	-- elif x == 2
		-- set state = "CCControlStateSelected"
	-- elif x == 3
		-- set state = "CCControlStateDisabled"
	-- endif

	-- set var = data.properties["title|"+tostr(x)]
	-- if var and var != "" 
{{'\t'}}{{name}}:setTitleForState(CCString:create("{{serializeString(var)}}"),{{state}})
	-- endif

	-- set var = data.properties["titleTTF|"+tostr(x)]
	-- if var and var != "" 
{{'\t'}}{{name}}:setTitleTTFForState("{{var}}",{{state}})
	-- endif

	-- set var = data.properties["titleTTFSize|"+tostr(x)]
	-- if var
{{'\t'}}{{name}}:setTitleTTFSizeForState({{var[0]}},{{state}})
	-- endif

	-- set var = data.properties["titleColor|"+tostr(x)]
	-- if var
{{'\t'}}{{name}}:setTitleColorForState(ccc3({{var[0]}},{{var[1]}},{{var[2]}}),{{state}})
	-- endif

	-- set var = data.properties["backgroundSpriteFrame|"+tostr(x)]
	-- if var and var[0] != "ccbResources/ccbDefaultImages.plist"
{{'\t'}}{{name}}:setBackgroundSpriteFrameForState({{getDisplayFrame(var)}},{{state}})
	-- endif

-- endfor
#{{'\t'}}{{name}}:setZoomOnTouchDown({{data.properties.zoomOnTouchDown}})
-- set var = data.properties.preferedSize
{{'\t'}}{{name}}:setPreferredSize(CCBNodeExtend.ccb_size({{var[0]}},{{var[1]}},{{var[2]}},{{parent}}))
-- set var = data.properties.labelAnchorPoint
#{{'\t'}}{{name}}:setLabelAnchorPoint(ccp({{var[0]}},{{var[1]}}))
{{'\t'}}{{name}}:setEnabled({{data.properties.enabled}})
-- set var = data.properties.ccControl
-- if var[1] == "1"
{{'\t'}}{{name}}:addHandleOfControlEvent(function()
{{'\t'}}{{'\t'}}GameAudio.dispatchEvent("pop")
{{'\t'}}{{'\t'}}_owner:{{var[0]}}({{name}}:getTag(), {{name}}) 
{{'\t'}}end,CCControlEventTouchUpInside)
-- else
{{'\t'}}{{name}}:addHandleOfControlEvent(function()
{{'\t'}}{{'\t'}}GameAudio.dispatchEvent("pop")
{{'\t'}}{{'\t'}}self:{{var[0]}}({{name}}:getTag(), {{name}})
{{'\t'}}end,CCControlEventTouchUpInside)
-- endif

{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 