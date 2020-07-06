import sys
import urllib2
import json
url = "http://whois.pconline.com.cn/ipJson.jsp?json=true"
if __name__ == '__main__':
    if(len(sys.argv)>=2 and str(sys.argv[1])=="addr"):
        r = urllib2.open(url)
        j = json.loads(r.read())
        print(j["addr"])
