import 'dart:convert';

Map<String, dynamic> jsonParse(String data) {
  return jsonDecode(data).cast<Map<String, dynamic>>();
}
