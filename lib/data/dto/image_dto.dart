class ImageDto {
  String _id;
  String _url;

  ImageDto(this._id, this._url);

  ImageDto.fromJson(Map<String, dynamic> json)
  : _id = json['id'],
    _url = json['urls']['thumb'];

  String get id => _id;

  String get url => _url;
}

class Urls{
  String _thumb;

  Urls(this._thumb);
  String get thumb => _thumb;
}

class ImageDtoPage {
  int _page;
  List<ImageDto>? _imageDtoList;

  ImageDtoPage(this._page, this._imageDtoList);

  List<ImageDto>? get imageDtoList => _imageDtoList;

  int get page => _page;

}
