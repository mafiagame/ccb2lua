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
import logging
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler


import ccbreader

def debug(text):
	print(text)
	return text


G_INDEX = 0
G_IPATH = ""
G_OPATH = ""
G_TPATH = ""
G_DATAS = dict()


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

	print "WARNING: getProperty [",_key,"] not find!"
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
	'CCButton.lua',
	'CCBFile.lua', 
	'CCNode.lua',
	'CCLayer.lua',
	'CCSprite.lua',
	'CCLabelTTF.lua',
	'CCLabelBMFont.lua',
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


# 生成所有layout文件
def output(_data):
	for key in _data:
		output_single(_data,key)


def output_single(_data, _name):
	resetIndex()
	ccb = _data[_name]
	convertccb2lua(ccb, _data)
	print "OUTPUT: ",_name,"done!"


def loadCCBData(_data, _name, _pathname):
	print "READING: ",_pathname

	customClass = ""
	if _data.has_key(_name) :
		customClass = _data[_name]["data"]["customClass"]

	print "customClass: ",customClass

	ccb = dict()
	# 类名
	ccb["class"] = _name.replace(".ccb","_layout")
	# lua文件
	ccb["out"] = G_OPATH+"/"+ccb["class"]+".lua"
	# 读取ccb文件
	data, dependents = ccbreader.parseCCB(_pathname, False)
	# 数据
	ccb["data"] = data
	# 依赖
	dep = dict()

	for key in dependents:
		path,name = os.path.split(key)
		dep[name]=True

	ccb["dependents"] = dep
	# 父类
	ccb["super"] = getSuperName(ccb["data"])

	_data[_name] = ccb

	return ccb["data"]["customClass"] != customClass


class MyEventHandler(FileSystemEventHandler):

	def on_created(self,event):
		global G_DATAS

		print "\nFILE CREATED : ", event.src_path
		path_name = event.src_path
		path,name = os.path.split(path_name)
		if name.find(".ccb") != -1:
			# customClass 有无改变,有改变的话检测有无ccb依赖此ccb
			if loadCCBData(G_DATAS, name, path_name):
				for key in G_DATAS:
					if G_DATAS[key]["dependents"].has_key(name):
						output_single(G_DATAS,key)

			output_single(G_DATAS, name)


def main():
	global G_OPATH
	global G_IPATH
	global G_TPATH
	global G_DATAS
	
	reload(sys)
	sys.setdefaultencoding('utf-8')

	if len(sys.argv) < 4:
		print "Invalide args! <ccb_path, output_path, template_path>"
		return

	G_IPATH = sys.argv[1]
	G_OPATH = sys.argv[2]
	G_TPATH = sys.argv[3]
	print "---------------------------------------------------------------"
	print "IPATH :",G_IPATH
	print "OPATH :",G_OPATH
	print "TPATH :",G_TPATH
	print "---------------------------------------------------------------"

	# 加载所有模板
	templates = dict((name, open(G_TPATH+"/"+name, 'rb').read()) for name in pages)
	env.loader = DictLoader(templates)

	# 生成目标目录
	if not os.path.isdir(G_OPATH):
		os.mkdir(G_OPATH)

	# 第一次加载所有ccb文件
	for name in os.listdir(G_IPATH):
		path_name = os.path.join(G_IPATH, name) 
		if os.path.isdir(path_name): 
			pass
		elif os.path.isfile(path_name) and name.find(".ccb") != -1:
			loadCCBData(G_DATAS, name, path_name)

	# 输出下
	output(G_DATAS)

	# 监控ccb文件变化
	logging.basicConfig(level=logging.INFO,
						format='%(asctime)s - %(message)s',
						datefmt='%Y-%m-%d %H:%M:%S')
	path = G_IPATH
	event_handler = MyEventHandler()
	observer = Observer()
	observer.schedule(event_handler, path, recursive=False)
	observer.start()

	print "\n"
	try:
		while True:
			time.sleep(1)
			sys.stdout.write(".")
			sys.stdout.flush()

	except KeyboardInterrupt:
		print "\n"
		observer.stop()
	observer.join()


if __name__ == '__main__':
	main()


