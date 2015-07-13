-- import 'CCNode.lua' as CCNode

-- macro rennder(data,name,parent,define,ccbdata)
-- if data.properties.position
{{'\t'}}local pos = {{CCNode.rennder_pos(data.properties.position,parent)}}
-- else
{{'\t'}}local pos = cc.p(0,0)
-- endif
-- set _ = nilProperty(data.properties,"position")
{{'\t'}}local size = {{CCNode.rennder_size(data.properties.contentSize,parent)}}
-- set _ = nilProperty(data.properties,"contentSize")
{{'\t'}}{{define}}{{name}} = cc.ui.UIListView.new({
{{'\t'}}{{'\t'}}viewRect = cc.rect(pos.x, pos.y, size.width, size.height),
-- set direction = data.properties.direction
-- if direction == 2
{{'\t'}}{{'\t'}}direction = cc.ui.UIScrollView.DIRECTION_BOTH,
-- elif direction == 1
{{'\t'}}{{'\t'}}direction = cc.ui.UIScrollView.DIRECTION_VERTICAL,
-- elif direction == 0
{{'\t'}}{{'\t'}}direction = cc.ui.UIScrollView.DIRECTION_HORIZONTAL,
-- endif
{{'\t'}}{{'\t'}}async = true,
{{'\t'}}})
-- if data.memberVarAssignmentName and data.memberVarAssignmentName != ""
{{'\t'}}:onTouch({{getListener(true, data.memberVarAssignmentName)}})
-- endif


{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 