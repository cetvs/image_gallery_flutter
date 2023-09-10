import 'package:flutter_app/data/dto/image_dto.dart';
import 'package:flutter_app/domain/image_domain.dart';

class LoadGalleryAction {
  final List<ImageDomain> _galleryList;
  final int _page;

  LoadGalleryAction(this._galleryList, this._page);

  int get page => _page;

  List<ImageDomain> get galleryList => _galleryList;
}
