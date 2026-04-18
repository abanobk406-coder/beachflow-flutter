import 'dart:convert';
import 'dart:io';

void main() {
  var file = File('collection.json');
  var content = file.readAsStringSync();
  var data = jsonDecode(content);

  void browse(dynamic obj, List<String> path) {
    if (obj is Map<String, dynamic>) {
      if (obj.containsKey('item')) {
        browse(obj['item'], path);
      }
      if (obj.containsKey('request')) {
         var name = obj['name'] ?? "";
         var req = obj['request'];
         var method = req['method'];
         var url = req['url'];
         String urlStr = url is Map ? url['raw'].toString() : url.toString();
         if (name.toLowerCase().contains('request') || name.toLowerCase().contains('track') || urlStr.contains('request-admin')) {
           print('PATH: ' + path.join(' > ') + ' > ' + name);
           print('REQ: ' + method + ' ' + urlStr);
         }
      }
      obj.forEach((key, value) {
        if (key != 'item' && key != 'request') {
           // browse(value, path + [key]); // too much
        }
      });
    } else if (obj is List) {
      for (var i = 0; i < obj.length; i++) {
        var item = obj[i];
        String name = item is Map ? (item['name'] ?? "") : "";
        browse(item, path + [name]);
      }
    }
  }

  browse(data, []);
}
