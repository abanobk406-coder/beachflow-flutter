import 'dart:convert';
import 'dart:io';

void main() {
  var file = File('collection.json');
  if (!file.existsSync()) {
    print("File not found");
    return;
  }
  var content = file.readAsStringSync();
  Map<String, dynamic> data = jsonDecode(content);

  void searchItems(List items) {
    for (var item in items) {
      if (item['item'] != null) {
        searchItems(item['item']);
      } else if (item['request'] != null) {
        var req = item['request'];
        var urlObj = req['url'];
        var urlStr = '';
        if (urlObj is Map) {
          urlStr = urlObj['raw'] ?? '';
        } else if (urlObj is String) {
          urlStr = urlObj;
        }

        if (urlStr.contains('my-bookings')) {
          print("Found my-bookings endpoint!");
          print("Method: \${req['method']}");
          if (item['responses'] != null && item['responses'].isNotEmpty) {
            for (var resp in item['responses']) {
              print("Response Name: \${resp['name']}");
              print("Body: \${resp['body']}");
            }
          }
        }
      }
    }
  }

  if (data['collection'] != null && data['collection']['item'] != null) {
    searchItems(data['collection']['item']);
  }
}
