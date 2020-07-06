#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import sys
import urllib2
import json
reload(sys)
sys.setdefaultencoding('utf-8')
url = "
def getAddr():
    try:
        r = urllib2.urlopen(r'http://whois.pconline.com.cn/ipJson.jsp?json=true')
        j = json.loads(r.read())
        print j["addr".encode('utf-8')]  
    except:
        print "None"
    
if __name__ == '__main__':
    if(len(sys.argv)>=2 and str(sys.argv[1])=="addr"):
        getAddr()
