import 'dart:convert';
import 'dart:io';

void main() {
  var file = File('collection.json');
  var content = file.readAsStringSync();
  var data = jsonDecode(content);

  void findRequest(dynamic obj) {
    if (obj is Map<String, dynamic>) {
      if (obj.containsKey('request') && obj['request'] is Map) {
        var req = obj['request'];
        var url = req['url'];
        if (url != null) {
            String urlStr = url is Map ? url['raw'].toString() : url.toString();
            if (urlStr.contains('request-admin')) {
              print('--- ' + req['method'] + ' ' + urlStr + ' ---');
            }
        }
      }
      obj.values.forEach(findRequest);
    } else if (obj is List) {
      obj.forEach(findRequest);
    }
  }

  findRequest(data);
}
