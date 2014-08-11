#!/usr/bin/env python  
# coding=utf-8  
# Python 2.7.3  
from bs4 import BeautifulSoup
import jinja2 as jj
import pprint
pp = pprint.PrettyPrinter(indent=4)

def cleanString(_s):
	print "-->>",_s
	try:
		return _s.join(_s.split()) 
	except:
		return ""	

def getValue(_soup):
	return _soup.findNextSibling()

def getKeyString(_soup):
	try:
		return _soup.next
	except:
		return ""


def getValueString(_soup):
	try:
		return _soup.findNextSibling().next
	except:
		return ""

def findAndGetValue(_soup, _key):
	_ = _soup.find(True,recursive=False,text=_key)
	return _.findNextSibling()



def parseDict(_soup):
	print "----------------------------------parseDict----------------------------------"
	_dict = dict()

	for key in _soup.findAll("key",recursive=False):
		k = cleanString(key.contents[0])
		v = getValue(key)
		if v.name == "array":
			_dict[k] = parseArray(v)
		elif v.name == "dict":
			_dict[k] = parseDict(v)
		elif v.name != "":
			_dict[k] = v.string

	return _dict



def parseArray(_soup):
	print "----------------------------------parseArray----------------------------------"
	_array = list()
	for v in _soup.contents:
		name = cleanString(v.next.name)
		if v.name == "array":
			_array.append(parseArray(v))
		elif v.name == "dict":
			_array.append(parseDict(v))
		elif v.name != "":
			_array.append(v.string)

	return _array



tpl = open('CCLayer.lua.tpl')
cclayer_tpl = tpl.read()
tpl.close()


def parseNode(_dict):
	baseClass = _dict["baseClass"]
	if baseClass == "CCLayer":
		template = jj.Template(cclayer_tpl)
		cclayer_out = template.render(data = _dict, super = baseClass.replace("CC",""))
		print(cclayer_out)

	# for v in _dict["children"]:
	# 	if isinstance(v, dict):
	# 		parseNode(v)


classname = "BattleWinLayer1"

# open ccb file
ccbfile = open("../proj.ccb/ccb/BattleWinLayer1.ccb",'r')
ccbfile_content = ccbfile.read()
ccbfile.close()

# find nodeGraph
soup = BeautifulSoup(ccbfile_content, 'xml')
_ = soup.dict

nodeGraph = findAndGetValue(_,"nodeGraph")

# parse all data
data = parseDict(nodeGraph)

# pp.pprint(data)

# parseNode(data)

baseClass = data["baseClass"]
template = jj.Template(cclayer_tpl)
cclayer_out = template.render(data = data, super = baseClass.replace("CC",""), classname = classname+"_layout")
print(cclayer_out)



# print data

# print nodeGraph