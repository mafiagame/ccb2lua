-- import 'CCNode.lua' as CCNode

-- macro rennder(data,name,parent,define) 
-- if data.properties.position
{{'\t'}}local pos = {{CCNode.rennder_pos(data.properties.position,parent)}}
-- else
{{'\t'}}local pos = cc.p(0,0)
-- endif
-- set _ = nilProperty(data.properties,"position")
{{'\t'}}local size = {{CCNode.rennder_size(data.children[0].properties.preferedSize,parent)}}
-- set _ = nilProperty(data.properties,"contentSize")
{{'\t'}}{{'\t'}}{{define}}{{name}} = cc.ui.UISlider.new(display.LEFT_TO_RIGHT, {
{{'\t'}}{{'\t'}}bar = "{{data.children[0].properties.spriteFrame[1]}}",
{{'\t'}}{{'\t'}}button = "{{data.children[1].properties.displayFrame[1]}}",
{{'\t'}}},{scale9 = true})
-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}:onSliderValueChanged({{getListener(true, data.memberVarAssignmentName)}})
-- endif
{{'\t'}}:setSliderValue(50)
{{'\t'}}:setSliderSize(size.width, size.height)
{{'\t'}}:align(display.LEFT_BOTTOM, pos.x, pos.y)
-- set _ = markIgnoreRenderChilden(data)
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro
