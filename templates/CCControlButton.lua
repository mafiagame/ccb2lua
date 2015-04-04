-- import 'CCNode.lua' as CCNode


-- macro rennder(data,name,parent,define,ccbdata)

{{'\t'}}{{define}}{{name}} = cc.ui.UIPushButton.new({
	-- set var = data.properties["backgroundSpriteFrame|1"]
{{'\t'}}{{'\t'}}normal = {{getDisplayFrameName(var)}},
	-- set var = data.properties["backgroundSpriteFrame|2"]
{{'\t'}}{{'\t'}}pressed = {{getDisplayFrameName(var)}}
	-- set disable = data.properties.disabledSpriteFrame
	-- if disable and disable[0] != "ccbResources/ccbDefaultImages.plist"
{{'\t'}}{{'\t'}}disabled = {{getDisplayFrame(disable)}},
	-- endif
{{'\t'}}},{scale9 = true})
{{'\t'}}:setButtonSize({{CCNode.rennder_wh(data.properties.preferedSize, parent, 1)}})
	-- set block = data.properties.ccControl
	-- if block[0] != 0
{{'\t'}}:onButtonClicked({{getListener(block[1] == 1,block[0])}})
	-- endif

	-- set font = data.properties["titleTTF|1"]
	-- set str = data.properties["title|1"]
	-- set size = data.properties["titleTTFSize|1"]
	-- set color = data.properties["titleColor|1"]
	-- if var and var != "" 
{{'\t'}}local label = cc.ui.UILabel.new({
            UILabelType = 2,
            font = "{{font}}",
            text = "{{serializeString(str)}}",
            size = {{size[0]}},
            color = cc.c3b({{color[0]}},{{color[1]}},{{color[2]}}),
        })
	-- set var = data.properties.labelAnchorPoint
{{'\t'}}label:setAnchorPoint(cc.p({{var[0]}},{{var[1]}}))
{{'\t'}}{{name}}:setButtonLabel("normal", label)
	-- endif

	-- if data.properties.enabled == "false"
{{'\t'}}{{name}}:setButtonEnabled(false)
	-- endif

{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 