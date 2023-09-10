import 'package:flutter_app/data/dto/image_dto.dart';
import 'package:flutter_app/domain/image_domain.dart';

class LoadGalleryAction {
  final List<ImageDto> _imageList;
  final int _page;

  LoadGalleryAction(this._imageList, this._page);

  int get page => _page;

  List<ImageDto> get imageList => _imageList;
}

class OpenImageFullscreenAction {
  final int _openedIndex;

  OpenImageFullscreenAction(this._openedIndex);

  int get openedIndex => _openedIndex;
}

class FavoriteChangeAction {
  final int _index;

  // final String _id;
  final bool _isFavorite;

  FavoriteChangeAction(this._index, this._isFavorite);

  int get index => _index;
  // String get id => _id;
  bool get isFavorite => _isFavorite;
}
