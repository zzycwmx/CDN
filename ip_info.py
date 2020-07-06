#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import sys
import urllib2
import json
reload(sys)
sys.setdefaultencoding('utf-8')
def unicode_convert(input_data):
    if isinstance(input_data, dict):
        return {unicode_convert(key): unicode_convert(value) for key, value in input_data.iteritems()}
    elif isinstance(input_data, list):
        return [unicode_convert(element) for element in input_data]
    elif isinstance(input_data, unicode):
        return input_data.encode('utf-8')
    else:
        return input_data
def getAddr():
        r = urllib2.urlopen(r'http://whois.pconline.com.cn/ipJson.jsp?json=true')
        j = unicode_convert(json.loads(r.read(),encoding='GBK'))
        print j["addr".encode('utf-8')]

if __name__ == '__main__':
    if(len(sys.argv)>=2 and str(sys.argv[1])=="addr"):
        getAddr()
