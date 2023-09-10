import 'package:flutter_app/data/dto/image_dto.dart';
import 'package:flutter_app/domain/image_domain.dart';
import 'package:flutter_app/domain/layer_parser.dart';
import 'package:flutter_app/domain/redux/state.dart';
import 'package:redux/redux.dart';

import '../../data/repository.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'action.dart';

final Repository repository = Repository.getInstance();

ThunkAction<MainState> loadNextPage = (Store<MainState> store) async {
  ImageDtoPage imageDtoPage = await repository.getPageByCount(store.state.page);
  var result = store.state.imageDomainList + (imageDtoPage.imageDtoList ?? []);
  // var result = imageDtoPage.imageDtoList ?? [];
  store.dispatch(LoadGalleryAction(result, imageDtoPage.page + 1));
};
