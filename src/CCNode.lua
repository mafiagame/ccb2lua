$ macro rennder_base_properties(name,properties) 
    $ for item in properties
    	$if item.name == "anchorPoint"
{{'\t'}}{{name}}:ccb_anchor({{item.value[0]}},{{item.value[1]}})
    	$elif item.name == "position"
{{'\t'}}{{name}}:ccb_pos({{item.value[0]}},{{item.value[1]}},{{item.value[2]}})
    	$elif item.name == "scale"
{{'\t'}}{{name}}:ccb_scale({{item.value[0]}},{{item.value[1]}},{{item.value[2]}},{{item.value[3]}})
    	$elif item.name == "ignoreAnchorPointForPosition"
{{'\t'}}{{name}}:ccb_ignore_anchor_for_position({{item.value}})
		$elif item.name == "displayFrame"
{{'\t'}}{{name}}:ccb_display_frame("{{item.value[0]}}")
		$elif item.name == "contentSize"
{{'\t'}}{{name}}:ccb_sizs({{item.value[0]}},{{item.value[1]}},{{item.value[2]}})
        $elif item.name == "color"
{{'\t'}}{{name}}:ccb_color({{item.value[0]}},{{item.value[1]}},{{item.value[2]}})
        $elif item.name == "opacity"
{{'\t'}}{{name}}:ccb_opacity({{item.value}})
    	$endif
    	
    $ endfor
$ endmacro


$ macro rennder(data,parent) 
    $ if data.customClass and data.customClass != ""
{{'\t'}}local node = CCBNodeExtend.extend(require("app.views.{{ data.customClass }}").new())
    $ else
{{'\t'}}local node = CCBNodeExtend.extend(display.newNode())
    $ endif
{{ rennder_base_properties("node",data.properties) }}
{{'\t'}}{{parent}}:addChild(node)

$ endmacro