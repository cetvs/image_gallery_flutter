import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../data/dto/image_dto.dart';
import '../domain/redux/state.dart';
import 'favorite_button.dart';

class FullscreenImage extends StatefulWidget {
  const FullscreenImage({super.key});

  @override
  State<FullscreenImage> createState() => _FullscreenImageState();
}

class _FullscreenImageState extends State<FullscreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreConnector<MainState, MainState>(
            converter: (store) => store.state,
            builder: (_, state) {
              var images = state.imageDomainList;
              var openedIndex = state.openedIndex;
              return Center(
                  child: Stack(children: [
                CachedNetworkImage(
                    imageUrl: images[openedIndex].url,
                    placeholder: (context, url) => const Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            ),
                          ),
                        ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error)),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                    child: FavoriteButton(
                        images[openedIndex].isFavorite, openedIndex))
              ]));
            }));
  }
}
