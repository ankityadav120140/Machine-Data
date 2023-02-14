import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getData(url) async {
  final response = await http.get(url);
  return jsonDecode(response.body);
}
