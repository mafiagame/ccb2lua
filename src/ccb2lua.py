#!/usr/bin/env python  
# coding=utf-8  
# Python 2.7.3  
from bs4 import BeautifulSoup
import pprint
from jinja2.environment import Environment
from jinja2.loaders import DictLoader


pp = pprint.PrettyPrinter(indent=4)

def cleanString(_s):
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
			if v.name == "true" or v.name == "false":
				_dict[k] = v.name
			else:
				value = cleanString(v.string)
			  	if value and value != "":
			  		_dict[k] = v.string

	return _dict



def parseArray(_soup):
	print "----------------------------------parseArray----------------------------------"
	_array = list()
	for v in _soup.contents:
		# name = cleanString(v.next.name)
		if v.name == "array":
			_array.append(parseArray(v))
		elif v.name == "dict":
			_array.append(parseDict(v))
		elif v.name != "":
			if v.name == "true" or v.name == "false":
				_array.append(v.name)
			else:
				value = cleanString(v.string)
			  	if value and value != "\n":
					_array.append(v.string)


	return _array




env = Environment(trim_blocks = True, line_statement_prefix = '$', line_comment_prefix = '#')
pages = (
	'CCBFile.lua', 
	'CCNode.lua',
	'CCLayer.lua',
	'CCSprite.lua',
	'CCLayerColor.lua'
)
templates = dict((name, open(name, 'rb').read()) for name in pages)
env.loader = DictLoader(templates)
# tmpl = env.get_template('page.html')

def parseNode(_dict):
	baseClass = _dict["baseClass"]
	if baseClass == "CCLayer":
		template = env.get_template(cclayer_tpl)
		# template = jj.Template(cclayer_tpl)
		cclayer_out = template.render(data = _dict, super = baseClass.replace("CC",""))
		print(cclayer_out)

	# for v in _dict["children"]:
	# 	if isinstance(v, dict):
	# 		parseNode(v)


classname = "BattleWinLayer1"

def parseRootNode(_dict):
	baseClass = _dict["baseClass"]
	template = env.get_template('CCBFile.lua')
	cclayer_out = template.render(data = _dict, super = baseClass.replace("CC",""), classname = classname+"_layout")
	print(cclayer_out)

	return cclayer_out


# open ccb file
ccbfile = open("../proj.ccb/ccb/BattleWinLayer.ccb",'r')
ccbfile_content = ccbfile.read()
ccbfile.close()

# find nodeGraph
soup = BeautifulSoup(ccbfile_content, 'xml')
_ = soup.dict

nodeGraph = findAndGetValue(_,"nodeGraph")

# parse all data
data = parseDict(nodeGraph)

pp.pprint(data)

content = parseRootNode(data)

lua = open("../scripts/app/scenes/BattleWinLayer_layout.lua",'w')
lua_content = lua.write(content)
lua.close()




# print data

# print nodeGraph