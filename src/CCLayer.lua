$ import 'CCNode.lua' as CCNode



$ macro rennder(data,parent)

$ if data.customClass and data.customClass != "" 
{{'\t'}}local layer = CCBNodeExtend.extend(require("app.views.{{ data.customClass }}").new())
$ else 
{{'\t'}}local layer = CCBNodeExtend.extend(display.newLayer())
$ endif
{{ CCNode.rennder_base_properties("layer",data.properties) }}
{{'\t'}}{{parent}}:addChild(layer)

$ endmacro 