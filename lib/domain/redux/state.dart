import '../image_domain.dart';

class MainState {
  late final List<ImageDomain> _imageDomainList;
  late final int _page;

  int get page => _page;
  List<ImageDomain> get imageDomainList => _imageDomainList;

  MainState(this._imageDomainList, this._page);

  MainState.init(List<ImageDomain> imageDomainList, int page)
      : this(imageDomainList, page);

  MainState.initialState()
      : _imageDomainList = List.empty(),
        _page = 1;

}
