#!/usr/bin/env python  
# coding=utf-8  
# Python 2.7.3  
from jinja2.environment import Environment
from jinja2.loaders import DictLoader

import ccbreader

# 加载所有模板
env = Environment(trim_blocks = True, line_statement_prefix = '--', line_comment_prefix = '#')
pages = (
	'CCBFile.lua', 
	'CCNode.lua',
	'CCLayer.lua',
	'CCSprite.lua',
	'CCLayerColor.lua'
)
templates = dict((name, open(name, 'rb').read()) for name in pages)
env.loader = DictLoader(templates)


# 获取ccb对应的lua类名（文件名）
def getClassName(_file, _data):
	classname = _data["customClass"]

	if not classname or classname == "":
		classname = _file.replace(".ccb","_layout")

	return classname

# 转化
def convertccb2lua(_in, _out, _name):
	ccb_data = ccbreader.parseCCB(_in+"/"+_name)

	# 获取文件名
	classname = getClassName(_name, ccb_data)

	# 渲染模板
	baseClass = ccb_data["baseClass"]
	template = env.get_template('CCBFile.lua')
	content = template.render(data = ccb_data, super = baseClass.replace("CC",""), classname = classname)

	# 写lua文件
	lua = open(_out+"/"+classname+".lua",'w')
	lua_content = lua.write(content)
	lua.close()


convertccb2lua("../proj.ccb/ccb/", "../scripts/app/scenes", "BattleWinLayer.ccb")


