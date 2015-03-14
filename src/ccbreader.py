#!/usr/bin/env python  
# coding=utf-8  
# Python 2.7.3  
from bs4 import BeautifulSoup
import pprint
pp = pprint.PrettyPrinter(indent=4)

# 清理字符串
def cleanString(_s):
	try:
		return _s.join(_s.split()) 
	except:
		return ""	

# 获取value（其实是这个节点的下一个兄弟节点）
def getValue(_soup):
	return _soup.findNextSibling()


# 查找关键字
def findAndGetValue(_soup, _key):
	_ = _soup.find(True,recursive=False,text=_key)
	return _.findNextSibling()


def parseProperties(properties):
	# pp.pprint(properties)

	new_properties = dict()
	for ppt in properties :
		new_properties[ppt["name"]] = ppt["value"]

	# pp.pprint(new_properties)

	return new_properties


# 解析字典
def parseDict(_soup, _dependents):
	_dict = dict()

	for key in _soup.findAll("key",recursive=False):
		k = cleanString(key.contents[0])
		v = getValue(key)
		if v.name == "array":
			dic = parseArray(v, _dependents)
			if k == "properties":
				dic = parseProperties(dic)
			_dict[k] = dic

		elif v.name == "dict":
			_dict[k] = parseDict(v, _dependents)
		elif v.name != "":
			if v.name == "true" or v.name == "false":
				_dict[k] = v.name
			else:
				value = v.string
				if value and value.find(".ccb") != -1 :
					_dependents[v.string] = True

				_dict[k] = v.string

	return _dict


# 解析数组
def parseArray(_soup, _dependents):
	_array = list()
	for v in _soup.contents:
		if v.name == "array":
			_array.append(parseArray(v, _dependents))
		elif v.name == "dict":
			_array.append(parseDict(v, _dependents))
		elif v.name != "":
			if v.name == "true" or v.name == "false":
				_array.append(v.name)
			else:
				value = cleanString(v.string)
				if value and value != "\n":
					_array.append(v.string)

	return _array


# 解析字典
def parseBaseInfo(_soup):
	_dict = dict()

	for key in _soup.findAll("key",recursive=False):
		k = cleanString(key.contents[0])
		v = getValue(key)
		if v.name == "array":
			pass #_dict[k] = parseArray(v)
		elif v.name == "dict":
			pass #_dict[k] = parseDict(v)
		elif v.name != "":
			if v.name == "true" or v.name == "false":
				_dict[k] = v.name
			else:
				_dict[k] = v.string

	return _dict


def loadCCB(_name):
	# 打开ccb文件
	ccbfile = open(_name,'r')
	ccbfile_content = ccbfile.read()
	ccbfile.close()

	# 创建soup
	return BeautifulSoup(ccbfile_content, 'xml')
	


# 解析ccb文件
def parseCCB(_name, _mini):
	soup = loadCCB(_name)
	_ = soup.dict

	# 获取跟节点
	nodeGraph = findAndGetValue(_,"nodeGraph")

	# 依赖
	dependents = dict()

	# 解析ccb
	if _mini:
		data = parseBaseInfo(nodeGraph)
	else:
		data = parseDict(nodeGraph, dependents)

	# pp.pprint(data)

	return data,dependents


