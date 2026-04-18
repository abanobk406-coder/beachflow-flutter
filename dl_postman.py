import json
import urllib.request

try:
    req = urllib.request.Request('https://documenter.gw.postman.com/api/collections/46910696/2sBXqCNNkB?segregateAuth=true&versionTag=latest')
    res = urllib.request.urlopen(req)
    data = json.loads(res.read())
    
    items = data.get('collection', data).get('item', [])
    with open('items.json', 'w', encoding='utf-8') as f:
        json.dump(items, f, indent=2)
    print("Successfully downloaded and saved to items.json")
except Exception as e:
    print(f"Error: {e}")
