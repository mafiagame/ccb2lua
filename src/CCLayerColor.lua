$ import 'CCNode.lua' as CCNode



$ macro rennder(data,parent)

$ if data.customClass and data.customClass != "" 
{{'\t'}}local mask = CCBNodeExtend.extend(require("app.views.{{ data.customClass }}").new())
$ else 
{{'\t'}}local mask = CCBNodeExtend.extend(CCLayerColor:create())
$ endif
{{ CCNode.rennder_base_properties("mask",data.properties) }}
{{'\t'}}{{parent}}:addChild(mask)

$ endmacro 