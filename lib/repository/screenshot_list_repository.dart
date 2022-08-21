import 'dart:convert';

import 'package:http/http.dart';
import 'package:keyword/models/screenshot_list_result.dart';

class ScreenshotListRepository {
  final String _baseUrl = "54.148.218.212:8080";

  Future<ScreenshotListResult> getScreenshotListView(int applicationId) async {
    Uri url = Uri.http(
        _baseUrl, '/api/detail', {'applicationId': applicationId.toString()});

    var response = await get(url);
    if (response.statusCode == 200) {
      ScreenshotListResult result =
          ScreenshotListResult.fromJson(json.decode(response.body));
      return result;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
