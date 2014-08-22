#!/usr/bin/env python  
# coding=utf-8  
# Python 2.7.3  

import os
import sys
from jinja2.environment import Environment
from jinja2.loaders import DictLoader

import ccbreader

# 加载所有模板
env = Environment(trim_blocks = True, line_statement_prefix = '--', line_comment_prefix = '#')
pages = (
	'ccb.lua',
	'CCMenu.lua',
	'CCMenuItemImage.lua',
	'CCBFile.lua', 
	'CCNode.lua',
	'CCLayer.lua',
	'CCSprite.lua',
	'CCLabelTTF.lua',
	'CCLayerColor.lua',
	'CCScale9Sprite.lua',
	'CCScrollView.lua',
)
templates = dict((name, open(name, 'rb').read()) for name in pages)

def debug(text):
  print text

def getProperty(_data, _key):
	for key in _data:
		if key["name"] == _key:
			return key["value"]
	print _key,"not find!"
	return ""

env.globals['debug']=debug
env.globals['getProperty']=getProperty

env.loader = DictLoader(templates)


# 获取父类名字
def getSuperName(_data):
	return _data["baseClass"].replace("CC","")

# 转化
def convertccb2lua(_data, ccbdata,  _out):
	# 渲染模板
	template = env.get_template('ccb.lua')
	content = template.render(data = _data["data"], ccbdata = ccbdata, super = _data["super"], classname = _data["class"])

	# 写lua文件
	lua = open(_out+"/"+_data["class"]+".lua",'w')
	lua.write(content)
	lua.close()


def main():
	reload(sys)
	sys.setdefaultencoding('utf-8')

	ipath = "../proj.ccb/ccb"
	opath = "../scripts/app/layout"

	data = dict()

	# 加载所有ccb文件
	for name in os.listdir(ipath):
		print name
		path_name = os.path.join(ipath, name) 
		if os.path.isdir(path_name): 
			pass
		elif os.path.isfile(path_name) and name.find(".ccb") != -1:
			ccb = dict()
			ccb["data"] = ccbreader.parseCCB(path_name)
			ccb["class"] = name.replace(".ccb","_layout")
			ccb["super"] = getSuperName(ccb["data"])
			data[name] = ccb

	# 生成目录
	if not os.path.isdir(opath):
		os.mkdir(opath)

	# 生成所有layout文件
	for key in data:
		convertccb2lua(data[key], data, opath)
		

if __name__ == '__main__':
    main()
