class ImageDto {
  String _id;
  String _url;
  bool _isFavorite;

  ImageDto(this._id, this._url, this._isFavorite);

  ImageDto.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _url = json['urls']['small'],
        _isFavorite = false;

  String get id => _id;

  String get url => _url;

  bool get isFavorite => _isFavorite;
}

class ImageDtoPage {
  int _page;
  List<ImageDto>? _imageDtoList;

  ImageDtoPage(this._page, this._imageDtoList);

  List<ImageDto>? get imageDtoList => _imageDtoList;

  int get page => _page;
}
