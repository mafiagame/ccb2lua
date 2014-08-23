-- import 'CCNode.lua' as CCNode

-- macro rennder(data,name,parent,ccbdata)

-- if data.customClass and data.customClass != "" 
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
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

	-- set var = getProperty(data.properties,"title|"+tostr(x))
	-- if var and var != "" 
{{'\t'}}{{name}}:setTitleForState(CCString:create("{{var}}"),{{state}})
	-- endif

	-- set var = getProperty(data.properties,"titleTTF|"+tostr(x))
	-- if var and var != "" 
{{'\t'}}{{name}}:setTitleTTFForState("{{var}}",{{state}})
	-- endif

	-- set var = getProperty(data.properties,"titleTTFSize|"+tostr(x))
	-- if var
{{'\t'}}{{name}}:setTitleTTFSizeForState({{var[0]}},{{state}})
	-- endif

	-- set var = getProperty(data.properties,"titleColor|"+tostr(x))
	-- if var
{{'\t'}}{{name}}:setTitleColorForState(ccc3({{var[0]}},{{var[1]}},{{var[2]}}),{{state}})
	-- endif

	-- set var = getProperty(data.properties,"backgroundSpriteFrame|"+tostr(x))
	-- if var and var[0] != "ccbResources/ccbDefaultImages.plist"
		-- if var[1]
{{'\t'}}{{name}}:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("{{var[1]}}","{{var[0]}}"),{{state}})
		-- else
{{'\t'}}{{name}}:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("{{var[0]}}"),{{state}})
		-- endif
	-- endif

-- endfor
#{{'\t'}}{{name}}:setZoomOnTouchDown({{getProperty(data.properties,"zoomOnTouchDown")}})
-- set var = getProperty(data.properties,"preferedSize")
{{'\t'}}{{name}}:setPreferredSize(CCBNodeExtend.ccb_size({{var[0]}},{{var[1]}},{{var[2]}},{{parent}}))
-- set var = getProperty(data.properties,"labelAnchorPoint")
#{{'\t'}}{{name}}:setLabelAnchorPoint(ccp({{var[0]}},{{var[1]}}))
{{'\t'}}{{name}}:setEnabled({{getProperty(data.properties,"enabled")}})
-- set var = getProperty(data.properties,"ccControl")
{{'\t'}}{{name}}:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchDown)
{{'\t'}}{{name}}:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchDragInside)
{{'\t'}}{{name}}:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchDragOutside)
{{'\t'}}{{name}}:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchDragEnter)
{{'\t'}}{{name}}:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchDragExit)
{{'\t'}}{{name}}:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchUpInside)
{{'\t'}}{{name}}:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchUpOutside)
{{'\t'}}{{name}}:addHandleOfControlEvent(handler(_owner, _owner.{{var[0]}}),CCControlEventTouchCancel)

{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 