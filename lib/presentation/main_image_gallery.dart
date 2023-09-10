import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/image_gallery.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../domain/redux/middleware.dart';
import '../domain/redux/state.dart';

class MainImageGallery extends StatefulWidget {
  const MainImageGallery({super.key, required this.title});

  final String title;

  @override
  State<MainImageGallery> createState() => _MainImageGalleryState();
}

class _MainImageGalleryState extends State<MainImageGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: StoreConnector<MainState, MainState>(
                converter: (store) => store.state,
                builder: (_, state) {
                  var store = StoreProvider.of<MainState>(context);
                  if (state.imageDomainList.isEmpty) {
                    store.dispatch(loadNextPage);
                  }
                  return ListView.builder(
                    itemCount: state.imageDomainList.length,
                    itemBuilder: (_, index) {
                      if (index + 1 == state.imageDomainList.length) {
                        store.dispatch(loadNextPage);
                      }
                      return ImageGallery(state.imageDomainList[index], index);
                    },
                  );
                })));
  }
}
