#!/usr/bin/env python  
# coding=utf-8  
# Python 2.7.3

try:
	import xml.etree.cElementTree as ET
except ImportError:
	import xml.etree.ElementTree as ET

import pprint
pp = pprint.PrettyPrinter(indent=4)


dependents = dict()

def parseValue(_type, _value):
	if _type == "integer":
		return int(_value)
	elif _type == "real":
		try:
			return int(_value)
		except ValueError:
			return round(float(_value), 4)
	elif _type == "string":
		return _value
	elif _type == "true":
		return True
	elif _type == "false":
		return False

	print "======================================================>>>>>>"
	print "Unknown Type:",_type, _value
	print "<<<<<<======================================================"
	
	return _value

def parseElement(_type, _value):
	if _type == "dict":
		return parseDict(_value)
	elif _type == "array":
		return parseArray(_value)
	else:
		return parseValue(_type, _value.text)


def parseProperties(_element):
	data = {}
	for e in _element:
		p_name  = parseValue(e[1].tag,e[1].text) 
		p_type  = parseValue(e[3].tag,e[3].text)
		p_value = parseElement(e[5].tag, e[5])

		data[p_name] = p_value
		# data[p_name] = {"value":p_value, "type":p_type}

	return data

def parseCustomProperties(_element):
	data = {}
	for e in _element:
		p_name      = parseValue(e[1].tag,e[1].text) 
		p_optimized = parseValue(e[3].tag,e[3].text)
		p_type      = parseValue(e[5].tag,e[5].text)
		p_value     = parseElement(e[7].tag, e[7])

		data[p_name] = p_value
		# data[p_name] = {"value":p_value, "type":p_type}

	return data

def parseArray(_element):
	data = []
	
	for e in _element:
		data.append(parseElement(e.tag, e))

	return data


def parseDict(_element):
	data = {}
	
	iterator = iter(_element)
	while True:
		try:
			key = iterator.next()
			value = iterator.next()
			if key.text == "properties":
				data[key.text] = parseProperties(value)
			elif key.text == "customProperties":
				data[key.text] = parseCustomProperties(value)
			else:
				data[key.text] = parseElement(value.tag, value)
		except StopIteration:
			break

	return data

def parseCCB(_pathname):
	tree = ET.ElementTree(file=_pathname)
	root = tree.getroot()[0]

	dependents = list()
	for e in root.findall(".//string"):
		if e.text and e.text.find(".ccb") != -1:
			dependents.append(e.text)

	return parseElement(root.tag, root)["nodeGraph"], dependents


def main():
	pp.pprint(parseCCB('../proj.ccb/ccb/Layer.ccb'))


if __name__ == '__main__':
	main()