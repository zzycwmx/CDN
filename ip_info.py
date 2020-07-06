import sys
import urllib2
import json
url = "http://whois.pconline.com.cn/ipJson.jsp?json=true"
def getAddr():
    try:
        r = urllib2.open(url)
        j = json.loads(r.read())
        return j["addr"]  
    except:
        return "None"
    
if __name__ == '__main__':
    if(len(sys.argv)>=2 and str(sys.argv[1])=="addr"):
        getAddr()
