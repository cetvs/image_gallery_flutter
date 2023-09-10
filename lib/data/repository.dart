import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/const.dart';
import 'dto/image.dart';

class Repository {
  static Repository? repo;
  int pageSize = 15;

  static Repository getInstance() {
    repo ??= Repository();
    return repo!;
  }

  Future<ImagePage> getPageByCount(int currentPage, int pageCount) async {
    final url = Uri.parse("$api"
        "photos=?"
        "&page=$currentPage"
        "&client_id=$clientId");
    final response = await http.get(url);
    return _parsePhotoPageResponse(response);
  }

  ImagePage _parsePhotoPageResponse(response) {
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      // remove 'jsonFlickrApi' in response string
      return ImagePage.fromJson(
          jsonDecode(body.substring(14, body.length - 1))["photos"]);
    } else {
      throw Exception("failed request");
    }
  }
}
