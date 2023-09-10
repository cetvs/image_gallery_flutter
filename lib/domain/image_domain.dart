class ImageDomain {
  final String? _title;
  final String? _imageLink;
  final bool _isLicked;

  ImageDomain(this._title, this._imageLink, this._isLicked);

  ImageDomain.fromPhoto(ImageDomain image)
      : _title = image.title,
        _imageLink = image.imageLink,
        _isLicked = false;

  bool get isLicked => _isLicked;

  String? get imageLink => _imageLink;

  String? get title => _title;
}
