import 'package:flutter_app/domain/redux/action.dart';
import 'package:flutter_app/domain/redux/state.dart';

MainState mainReducer(MainState state, dynamic action) {
  if (action is LoadGalleryAction) {
    return _loadImageGallery(action);
  }
  // if (action is LikePressedAction) {
  //   return _likePressed(state, action);
  // }
  // if (action is OpenFullscreenAction) {
  //   return _openFullscreen(state, action);
  // }
  return state;
}

MainState _loadImageGallery(LoadGalleryAction action) {
  return MainState.init(action.galleryList, action.page);
}
