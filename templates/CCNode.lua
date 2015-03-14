
-- macro rennder_base_properties(name,properties,parent)
    -- for key in properties
        -- set value = properties[key]
        -- if checkPropertyInvalide(key, value)
            -- if key == "anchorPoint":
{{'\t'}}{{name}}:setAnchorPoint(ccp({{value[0]}},{{value[1]}}))
        	--elif key == "position"
{{'\t'}}{{name}}:setPosition(CCBNodeExtend.ccb_pos({{value[0]}},{{value[1]}},{{value[2]}},{{parent}}))
        	--elif key == "scale"
                -- if value[0] == value[1]
{{'\t'}}{{name}}:setScale({{value[0]}})
                -- else
{{'\t'}}{{name}}:setScaleX({{value[0]}})
{{'\t'}}{{name}}:setScaleY({{value[1]}})
                -- endif
        	--elif key == "ignoreAnchorPointForPosition"
{{'\t'}}{{name}}:setIgnoreAnchorPointForPosition({{value}})
    		--elif key == "displayFrame" and value[0] and value[0] != ""
{{'\t'}}{{name}}:setDisplayFrame({{getDisplayFrame(value)}})
    		--elif key == "contentSize"
{{'\t'}}{{name}}:setContentSize(CCBNodeExtend.ccb_size({{value[0]}},{{value[1]}},{{value[2]}},{{parent}}))
            --elif key == "preferedSize"
{{'\t'}}{{name}}:setPreferredSize(CCBNodeExtend.ccb_size({{value[0]}},{{value[1]}},{{value[2]}},{{parent}}))
            --elif key == "color"
{{'\t'}}{{name}}:setColor(ccc3({{value[0]}},{{value[1]}},{{value[2]}}))
            --elif key == "opacity"
{{'\t'}}{{name}}:setOpacity({{value}})
            --elif key == "tag"
{{'\t'}}{{name}}:setTag({{value}})
            --elif key == "rotation"
{{'\t'}}{{name}}:setRotation({{value}})
            --elif key == "skew"
                -- if value[0] != "0.0"
{{'\t'}}{{name}}:setSkewX({{value[0]}})
                -- elif value[1] != "0.0"
{{'\t'}}{{name}}:setSkewY({{value[1]}})
                -- endif
            --elif key == "visible"
{{'\t'}}{{name}}:setVisible({{value}})
            --endif
        -- endif
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