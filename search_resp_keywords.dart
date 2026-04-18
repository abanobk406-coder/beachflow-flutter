import 'dart:convert';
import 'dart:io';

void main() {
  var file = File('collection.json');
  var content = file.readAsStringSync();
  var data = jsonDecode(content);

  void findKeywordInResponses(dynamic obj) {
    if (obj is Map<String, dynamic>) {
      if (obj.containsKey('response') && obj['response'] is List) {
        for (var resp in obj['response']) {
          String body = resp['body']?.toString() ?? "";
          if (body.toLowerCase().contains('admin') || body.toLowerCase().contains('request')) {
            print('--- RESPONSE BODY ---');
            print(body);
          }
        }
      }
      obj.values.forEach(findKeywordInResponses);
    } else if (obj is List) {
      obj.forEach(findKeywordInResponses);
    }
  }

  findKeywordInResponses(data);
}
