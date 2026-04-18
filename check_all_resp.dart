import 'dart:convert';
import 'dart:io';

void main() {
  var file = File('collection.json');
  var content = file.readAsStringSync();
  var data = jsonDecode(content);

  void findRequest(dynamic obj) {
    if (obj is Map<String, dynamic>) {
      if (obj.containsKey('response') && obj['response'] is List && obj['response'].isNotEmpty) {
          String bodyStr = obj['response'][0]['body'].toString();
          if (bodyStr.contains('request') || bodyStr.contains('admin')) {
             print('Response containing keywords: \n' + bodyStr);
          }
      }
      obj.values.forEach(findRequest);
    } else if (obj is List) {
      obj.forEach(findRequest);
    }
  }

  findRequest(data);
}
