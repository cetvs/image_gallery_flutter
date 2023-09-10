import 'package:flutter_app/data/dto/image_dto.dart';

import 'image_domain.dart';

class LayerParser {
  static ImageDomain parse(ImageDto imageDto) {
    return ImageDomain(imageDto.id, imageDto.url);
  }
}
