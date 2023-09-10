import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/const.dart';
import 'dto/image_dto.dart';

class Repository {
  static Repository? repo;
  int pageSize = 15;

  static Repository getInstance() {
    repo ??= Repository();
    return repo!;
  }

  Future<ImageDtoPage> getPageByCount(int page) async {
    final url = Uri.parse("$api"
        "photos?"
        "page=$page"
        "&client_id=$clientId");
    final response = await http.get(url);
    return ImageDtoPage(page, _parsePhotoPageResponse(response));
  }

  List<ImageDto> _parsePhotoPageResponse(response) {
    // if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final responseList = jsonDecode(body);
      List<ImageDto> result = [];
      for (var i = 0; i < responseList.length; i++) {
        result.add(ImageDto.fromJson(responseList[i]));
      }
      return result;
    // } else {
    //   throw Exception("failed request");
    // }
  }
}
