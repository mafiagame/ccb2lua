#!/usr/bin/env python  
# coding=utf-8  
# Python 2.7.3  

import os
import sys
from jinja2.environment import Environment
from jinja2.loaders import DictLoader

import ccbreader

def debug(text):
	print text
	return text


G_INDEX = 0

def getIndex():
	global G_INDEX
	G_INDEX+=1
	return G_INDEX


def getProperty(_data, _key):
	for key in _data:
		if key["name"] == _key:
			if _key == "ccbFile":
				path,name = os.path.split(key["value"])
				print "info: ",path,name
				return name
			else:
				return key["value"]

	print "warning: ",_key,"not find!"
	return ""

def tostr(text):
	return str(text)


 # 所有模板
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
	'CCControlButton.lua',
)
env.globals['debug']       = debug
env.globals['getProperty'] = getProperty
env.globals['tostr']       = tostr
env.globals['getIndex']    = getIndex

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

	if len(sys.argv) < 4:
		print "Invalide args! <ccb_path, output_path, template_path>"
		return

	ipath = sys.argv[1]
	opath = sys.argv[2]
	tpath = sys.argv[3]

	# 加载所有模板
	templates = dict((name, open(tpath+"/"+name, 'rb').read()) for name in pages)
	env.loader = DictLoader(templates)



	data = dict()

	# 加载所有ccb文件
	for name in os.listdir(ipath):
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
		print key,"done!"
		
	print "\nSuccess!"

if __name__ == '__main__':
    main()
