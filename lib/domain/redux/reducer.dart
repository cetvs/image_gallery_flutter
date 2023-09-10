import 'package:flutter_app/domain/image_domain.dart';
import 'package:flutter_app/domain/redux/action.dart';
import 'package:flutter_app/domain/redux/state.dart';

import '../../data/dto/image_dto.dart';

MainState mainReducer(MainState state, dynamic action) {
  if (action is LoadGalleryAction) {
    return _loadImageGallery(action);
  }
  if (action is OpenImageFullscreenAction) {
    return _openImageFullscreen(state, action);
  }
  if (action is FavoriteChangeAction) {
    return _favoriteChangeAction(state, action);
  }
  return state;
}

MainState _loadImageGallery(LoadGalleryAction action) {
  return MainState.init(action.imageList, action.page);
}

MainState _openImageFullscreen(
    MainState state, OpenImageFullscreenAction action) {
  return MainState.copy(state, action.openedIndex);
}

MainState _favoriteChangeAction(MainState state, FavoriteChangeAction action) {
  var id = state.imageDomainList[action.index].id;
  var url = state.imageDomainList[action.index].url;
  List<ImageDto> res = [];
  for (var element in state.imageDomainList) {
    if (element.id != id) {
      res.add(element);
    } else {
      res.add(ImageDto(id, url, action.isFavorite));
    }
  }
  return MainState.newState(res, action.index, state.page);
}
