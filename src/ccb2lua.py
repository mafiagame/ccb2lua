	#!/usr/bin/env python  
# coding=utf-8  
# Python 2.7.3  

import os
import sys
import time

# jinja2
from jinja2.environment import Environment
from jinja2.loaders import DictLoader

# pprint
import pprint
pp = pprint.PrettyPrinter(indent=4)

# watchdog
import logging
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler


import ccbreader

def debug(text):
	print(text)
	return text


G_INDEX = 0
G_FUNCTION = dict()
G_DATAS = dict()
G_TEMPLATES = list()


def getIndex():
	global G_INDEX
	G_INDEX+=1
	return G_INDEX

def resetIndex():
	global G_INDEX
	G_INDEX = 0

def resetFunction():
	global G_FUNCTION
	G_FUNCTION = dict()


def getFunction():
	global G_FUNCTION
	return G_FUNCTION

def getListener(_target, _name):
	global G_INDEX
	G_FUNCTION[_name]=True
	return "handler({target}, {target}.{name})".format(target="_owner",name=_name)


def getDisplayFrameName(_value):
	count = len(_value)
	if count == 0:
		return "nil"
	elif count == 1:
		return "\""+_value[0]+"\""
	elif count == 2:
		return "\"#"+_value[1]+"\""


def getDisplayFrame2(_value):
	print(_value)
	count = len(_value)
	if count == 0:
		return "nil"
	elif count == 1:
		return "ccbutils.ccb_display_frame(\""+_value[0]+"\")"
	elif count == 2:
		return "ccbutils.ccb_display_frame(\""+_value[1]+"\",\""+_value[0]+"\")"

def getDisplayFrame(_value):
	print(_value)
	count = len(_value)
	if count == 0:
		return "nil"
	elif count == 1:
		return "\""+_value[0]+"\""
	elif count == 2:
		return "ccbutils.ccb_display_frame(\""+_value[1]+"\",\""+_value[0]+"\")"


def checkPropertyInvalide(_name, _value):
	print "_name:",_name, _value
	pp.pprint(_value)
	if not _value:
		return False

	if _name == "scale":
		if len(_value) == 1:
			return _value != "1"
		else:
			return _value[0] != "1" or _value[1] != "1"
	elif _name == "opacity":
		return _value != "255"
	elif _name == "color":
		print _value
		return _value[0] != "255" or _value[1] != "255" or _value[2] != "255"
	# elif _name == "ignoreAnchorPointForPosition":
	# 	return _value != "false"
	elif _name == "tag":
		return _value != "-1"

	return True


def isDefaultVarName(_name):
	global G_TEMPLATES
	return _name in G_TEMPLATES

def nilProperty(_data, _key):
	if _data.has_key(_key):
		_data[_key] = None
		return _data

	print "warning: nilProperty [",_key,"] not find!"
	return ""

def serializeString(_string):
	if not _string:
		return ""
		
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

env.globals['debug']                 = debug
env.globals['nilProperty']           = nilProperty
env.globals['tostr']                 = tostr
env.globals['getIndex']              = getIndex
env.globals['getCustomClass']        = getCustomClass
env.globals['serializeString']       = serializeString
env.globals['isDefaultVarName']      = isDefaultVarName
env.globals['checkPropertyInvalide'] = checkPropertyInvalide
env.globals['getDisplayFrame']       = getDisplayFrame
env.globals['getDisplayFrame2']       = getDisplayFrame2
env.globals['getDisplayFrameName']   = getDisplayFrameName
env.globals['getListener']           = getListener
env.globals['getFunction']           = getFunction


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
	resetFunction()
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
	ccb["out"] = output_path+"/"+ccb["class"]+".lua"
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
	global output_path
	global G_DATAS
	global G_TEMPLATES
	
	# 支持中文
	reload(sys)
	sys.setdefaultencoding('utf-8')

	# 读取参数
	if len(sys.argv) < 4:
		print "Invalide args! <ccb_path, output_path, template_path>"
		return

	ccb_path = sys.argv[1]
	output_path = sys.argv[2]
	template_path = sys.argv[3]
	print "---------------------------------------------------------------"
	print "ccb_path      : ",ccb_path
	print "output_path   : ",output_path
	print "template_path : ",template_path
	print "---------------------------------------------------------------"



	# 加载所有模板
	G_TEMPLATES = os.listdir(template_path)

	templates = dict((name, open(template_path+"/"+name, 'rb').read()) for name in G_TEMPLATES)
	env.loader = DictLoader(templates)

	# 生成目标目录
	if not os.path.isdir(output_path):
		os.mkdir(output_path)

	# 第一次加载所有ccb文件
	for name in os.listdir(ccb_path):
		path_name = os.path.join(ccb_path, name) 
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
	event_handler = MyEventHandler()
	observer = Observer()
	observer.schedule(event_handler, ccb_path, recursive=False)
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


