import 'dart:convert';

import 'package:http/http.dart';

import '../models/detail_result.dart';

class DetailRepogitory {
  final String _baseUrl = "54.148.218.212:8080";

  Future<DetailResult> getDetailListView(int applicationId) async {
    Uri url = Uri.http(
        _baseUrl, '/api/screen', {'applicationId': applicationId.toString()});

    var response = await get(url);
    if (response.statusCode == 200) {
      DetailResult result = DetailResult.fromJson(json.decode(response.body));
      return result;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
