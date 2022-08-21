import 'dart:convert';

import 'package:http/http.dart';
import 'package:keyword/models/home_result.dart';

class HomeRepository {
  final String _baseUrl = "54.148.218.212:8080";

  Future<List<HomeResult>> getHomeView() async {
    Uri url = Uri.http(_baseUrl, '/api/home');

    var response = await get(url);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      List<HomeResult> list =
          parsed.map<HomeResult>((json) => HomeResult.fromJson(json)).toList();
      return list;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
