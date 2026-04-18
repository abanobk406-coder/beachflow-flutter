const fs = require('fs');
const data = JSON.parse(fs.readFileSync('collection.json'));
const userModule = data.collection.item.find(i => i.name.includes('User'));
if (userModule) {
  userModule.item.forEach(i => {
    if (i.name.toLowerCase().includes('user') || i.name.toLowerCase().includes('profile') || i.request.url.path.includes('profile')) {
      console.log(i.name, i.request.method, i.request.url.path.join('/'));
      if(i.response && i.response.length > 0 && i.response[0].body) {
        console.log('Response example:', i.response[0].body);
      }
    }
  });
}
