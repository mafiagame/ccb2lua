-- macro rennder_node_properties(name,properties,parent) 
    -- for item in properties
        --if item.name == "anchorPoint"
{{'\t'}}{{name}}:setAnchorPoint(ccp({{item.value[0]}},{{item.value[1]}}))
        --elif item.name == "position"
{{'\t'}}{{name}}:setPosition(CCBNodeExtend.ccb_pos({{item.value[0]}},{{item.value[1]}},{{item.value[2]}},{{parent}}))
        --elif item.name == "scale"
            -- if item.value[1]
{{'\t'}}{{name}}:setScaleX({{item.value[0]}})
{{'\t'}}{{name}}:setScaleY({{item.value[1]}})
            -- else
{{'\t'}}{{name}}:setScale({{item.value}})
            -- endif
        --elif item.name == "ignoreAnchorPointForPosition"
{{'\t'}}{{name}}:setIgnoreAnchorPointForPosition({{item.value}})
        --elif item.name == "contentSize"
{{'\t'}}{{name}}:setContentSize(CCBNodeExtend.ccb_size({{item.value[0]}},{{item.value[1]}},{{item.value[2]}},{{parent}}))
        --elif item.name == "preferedSize"
{{'\t'}}{{name}}:setPreferredSize(CCBNodeExtend.ccb_size({{item.value[0]}},{{item.value[1]}},{{item.value[2]}},{{parent}}))
        --elif item.name == "color"
{{'\t'}}{{name}}:setColor(ccc3({{item.value[0]}},{{item.value[1]}},{{item.value[2]}}))
        --elif item.name == "opacity"
{{'\t'}}{{name}}:setOpacity({{item.value}})
        --elif item.name == "tag"
{{'\t'}}{{name}}:setTag({{item.value}})
        --elif item.name == "rotation"
{{'\t'}}{{name}}:setRotation({{item.value}})
        --elif item.name == "visible"
{{'\t'}}{{name}}:setVisible({{item.value}})
        --endif
    -- endfor
-- endmacro



-- macro rennder_base_properties(name,properties,parent) 
    -- for item in properties
    	--if item.name == "anchorPoint"
{{'\t'}}{{name}}:setAnchorPoint(ccp({{item.value[0]}},{{item.value[1]}}))
    	--elif item.name == "position"
{{'\t'}}{{name}}:setPosition(CCBNodeExtend.ccb_pos({{item.value[0]}},{{item.value[1]}},{{item.value[2]}},{{parent}}))
    	--elif item.name == "scale"
            -- if item.value[1]
{{'\t'}}{{name}}:setScaleX({{item.value[0]}})
{{'\t'}}{{name}}:setScaleY({{item.value[1]}})
            -- else
{{'\t'}}{{name}}:setScale({{item.value}})
            -- endif
    	--elif item.name == "ignoreAnchorPointForPosition"
{{'\t'}}{{name}}:setIgnoreAnchorPointForPosition({{item.value}})
		--elif item.name == "displayFrame" and item.value[0] and item.value[0] != ""
            -- if item.value[1]
{{'\t'}}{{name}}:setDisplayFrame(CCBNodeExtend.ccb_display_frame("{{item.value[1]}}","{{item.value[0]}}"))
            -- else
{{'\t'}}{{name}}:setDisplayFrame(CCBNodeExtend.ccb_display_frame("{{item.value[0]}}"))
            -- endif
		--elif item.name == "contentSize"
{{'\t'}}{{name}}:setContentSize(CCBNodeExtend.ccb_size({{item.value[0]}},{{item.value[1]}},{{item.value[2]}},{{parent}}))
        --elif item.name == "preferedSize"
{{'\t'}}{{name}}:setPreferredSize(CCBNodeExtend.ccb_size({{item.value[0]}},{{item.value[1]}},{{item.value[2]}},{{parent}}))
        --elif item.name == "color"
{{'\t'}}{{name}}:setColor(ccc3({{item.value[0]}},{{item.value[1]}},{{item.value[2]}}))
        --elif item.name == "opacity"
{{'\t'}}{{name}}:setOpacity({{item.value}})
        --elif item.name == "tag"
{{'\t'}}{{name}}:setTag({{item.value}})
        --elif item.name == "rotation"
{{'\t'}}{{name}}:setRotation({{item.value}})
        --elif item.name == "visible"
{{'\t'}}{{name}}:setVisible({{item.value}})
        --endif
    -- endfor
-- endmacro


-- macro rennder(data,name,parent) 
    -- if data.customClass and data.customClass != ""
{{'\t'}}local {{name}} = require("app.views.{{ data.customClass }}").new()
    -- else
{{'\t'}}local {{name}} = display.newNode()
    -- endif
{{ rennder_base_properties(name,data.properties,parent) }}
-- endmacro