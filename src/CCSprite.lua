$ import 'CCNode.lua' as CCNode



$ macro rennder(data,parent)

$ if data.customClass and data.customClass != "" 
{{'\t'}}local sprite = CCBNodeExtend.extend(require("app.views.{{ data.customClass }}").new())
$ else 
{{'\t'}}local sprite = CCBNodeExtend.extend(display.newSprite())
$ endif
{{ CCNode.rennder_base_properties("sprite",data.properties) }}
{{'\t'}}{{parent}}:addChild(sprite)

$ endmacro 