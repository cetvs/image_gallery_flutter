import '../../data/dto/image_dto.dart';
import '../image_domain.dart';

class MainState {
  late final List<ImageDto> _imageDomainList;
  late final int _page;
  int? _openedIndex;

  List<ImageDto> get imageDomainList => _imageDomainList;

  int get page => _page;

  int get openedIndex => _openedIndex ?? 0;

  MainState(this._imageDomainList, this._page);

  MainState.init(List<ImageDto> imageDomainList, int page)
      : this(imageDomainList, page);

  MainState.initialState()
      : _imageDomainList = List.empty(),
        _page = 1;

  MainState.copy(MainState state, int index)
      : _imageDomainList = state.imageDomainList,
        _page = state.page,
        _openedIndex = index;
}
