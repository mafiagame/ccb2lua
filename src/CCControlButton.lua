-- import 'CCNode.lua' as CCNode

-- macro rennder(data,parent,ccbdata)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local cccb = require("app.views.{{ data.customClass }}").new()
-- else 
{{'\t'}}local cccb = CCControlButton:create()
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

	-- set var = getProperty(data.properties,"title|"+tostr(x))
	-- if var and var != "" 
{{'\t'}}cccb:setTitleForState(CCString:create("{{var}}"),{{state}})
	-- endif

	-- set var = getProperty(data.properties,"titleTTF|"+tostr(x))
	-- if var and var != "" 
{{'\t'}}cccb:setTitleTTFForState("{{var}}",{{state}})
	-- endif

	-- set var = getProperty(data.properties,"titleTTFSize|"+tostr(x))
	-- if var
{{'\t'}}cccb:setTitleTTFSizeForState({{var[0]}},{{state}})
	-- endif

	-- set var = getProperty(data.properties,"titleColor|"+tostr(x))
	-- if var
{{'\t'}}cccb:setTitleColorForState(ccc3({{var[0]}},{{var[1]}},{{var[2]}}),{{state}})
	-- endif

	-- set var = getProperty(data.properties,"backgroundSpriteFrame|"+tostr(x))
	-- if var and var[0] != "ccbResources/ccbDefaultImages.plist"
		-- if var[1]
{{'\t'}}cccb:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("{{var[1]}}","{{var[0]}}"),{{state}})
		-- else
{{'\t'}}cccb:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("{{var[0]}}"),{{state}})
		-- endif
	-- endif

-- endfor
#{{'\t'}}cccb:setZoomOnTouchDown({{getProperty(data.properties,"zoomOnTouchDown")}})
-- set var = getProperty(data.properties,"preferedSize")
{{'\t'}}cccb:setPreferredSize(CCBNodeExtend.ccb_size({{var[0]}},{{var[1]}},{{var[2]}},{{parent}}))
-- set var = getProperty(data.properties,"labelAnchorPoint")
#{{'\t'}}cccb:setLabelAnchorPoint(ccp({{var[0]}},{{var[1]}}))
{{'\t'}}cccb:setEnabled({{getProperty(data.properties,"enabled")}})
-- set var = getProperty(data.properties,"ccControl")
{{'\t'}}cccb:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchDown)
{{'\t'}}cccb:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchDragInside)
{{'\t'}}cccb:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchDragOutside)
{{'\t'}}cccb:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchDragEnter)
{{'\t'}}cccb:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchDragExit)
{{'\t'}}cccb:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchUpInside)
{{'\t'}}cccb:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchUpOutside)
{{'\t'}}cccb:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchCancel)

{{ CCNode.rennder_base_properties("cccb",data.properties,parent) }}
{{'\t'}}{{parent}}:addChild(cccb)

-- endmacro 