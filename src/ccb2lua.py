#!/usr/bin/env python  
# coding=utf-8  
# Python 2.7.3  

import os
import sys
import time
from jinja2.environment import Environment
from jinja2.loaders import DictLoader
import pprint
import thread
pp = pprint.PrettyPrinter(indent=4)

import ccbreader

def debug(text):
	print(text)
	return text


G_INDEX = 0
G_THREAD_COUNT = 0

def getIndex():
	global G_INDEX
	G_INDEX+=1
	return G_INDEX

def resetIndex():
	global G_INDEX
	G_INDEX = 0

def getProperty(_data, _key):
	for key in _data:
		if key["name"] == _key:
			if _key == "ccbFile":
				path,name = os.path.split(key["value"])
				print "info: ",path,name
				return name
			else:
				return key["value"]

	print "warning: getProperty [",_key,"] not find!"
	return ""

def nilProperty(_data, _key):
	for key in _data:
		if key["name"] == _key:
			key["value"] == ""
			return ""

	print "warning: nilProperty [",_key,"] not find!"
	return ""

def serializeString(_string):
	return _string.replace("\n","\\n")


def tostr(text):
	return str(text)

def getCustomClass(prototype):
	prototype_data = prototype["data"]
	classname = ""
	if prototype_data.has_key("customClass") and prototype_data["customClass"] and prototype_data["customClass"] != "":
		classname = prototype_data["customClass"]
	else:
		if prototype_data.has_key("jsController") and prototype_data["jsController"] and prototype_data["jsController"] != "":
			classname = prototype_data["jsController"]
		else:
			if prototype_data.has_key("displayName") and prototype_data["displayName"] and prototype_data["displayName"] != "" and prototype_data["displayName"].find("CC") == -1:
				classname = prototype_data["displayName"]

	return classname


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
env.globals['nilProperty'] = nilProperty
env.globals['tostr']       = tostr
env.globals['getIndex']    = getIndex
env.globals['getCustomClass']    = getCustomClass
env.globals['serializeString']    = serializeString

# 获取父类名字
def getSuperName(_data):
	return _data["baseClass"].replace("CC","")

# 转化
def convertccb2lua(_data, ccbdata):
	# 渲染模板
	template = env.get_template('ccb.lua')
	content = template.render(data = _data["data"], ccbdata = ccbdata, super = _data["super"], classname = _data["class"])

	# 写lua文件
	lua = open(_data["out"],'w')
	lua.write(content)
	lua.close()



#判断文件的最后修改时间  
def checkNeedDeal(_name, _out):
	# 暂时取消这个优化
	return True

	if not os.path.isfile(_out):
		return True

	now_time = time.time()
	mod_time = os.path.getmtime(_name)

	return (now_time-mod_time)/60 <= 10


# 生成所有layout文件
def output(_data):
	for key in _data:
		resetIndex()
		ccb = _data[key]
		if not ccb["mini"]:
			convertccb2lua(ccb, _data)
			print key,"done!"

	print "\nSuccess!"


def readCCBData(_data, _name, _opath, _pathname):
	ccb = dict()
	# 类名
	ccb["class"] = _name.replace(".ccb","_layout")
	# lua文件
	ccb["out"] = _opath+"/"+ccb["class"]+".lua"
	# 数据
	if checkNeedDeal(_pathname, ccb["out"]):
		ccb["data"] = ccbreader.parseCCB(_pathname, False)
		ccb["mini"] = False
	else:
		ccb["data"] = ccbreader.parseCCB(_pathname, True)
		ccb["mini"] = True
	# 父类
	ccb["super"] = getSuperName(ccb["data"])
	_data[_name] = ccb

	global G_THREAD_COUNT
	G_THREAD_COUNT = G_THREAD_COUNT - 1


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

	# 生成目标目录
	if not os.path.isdir(opath):
		os.mkdir(opath)

	data = dict()

	global G_THREAD_COUNT
	G_THREAD_COUNT = 0

	file_list = list()

	# 加载所有ccb文件
	for name in os.listdir(ipath):
		path_name = os.path.join(ipath, name) 
		if os.path.isdir(path_name): 
			pass
		elif os.path.isfile(path_name) and name.find(".ccb") != -1:
			file_data = dict()
			file_data["name"] = name
			file_data["path_name"] = path_name
			file_list.append(file_data)


	G_THREAD_COUNT = len(file_list)
	# 解析ccb数据
	for fi in file_list:
		thread.start_new_thread(readCCBData,(data, fi["name"], opath, fi["path_name"]))
		# readCCBData(data, fi["name"], opath, fi["path_name"])

	while G_THREAD_COUNT > 0:
		print "G_THREAD_COUNT :",G_THREAD_COUNT
		time.sleep(1)

	# 输出
	output(data)


if __name__ == '__main__':
    main()
