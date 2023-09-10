import 'package:flutter/material.dart';
import 'package:flutter_app/domain/redux/action.dart';
import 'package:flutter_app/domain/redux/state.dart';
import 'package:flutter_app/presentation/favorite_button.dart';
import 'package:flutter_app/presentation/fullscreen_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../data/dto/image_dto.dart';

class ImageGallery extends StatelessWidget {
  final ImageDto imageDto;
  final int imageIndex;

  const ImageGallery(this.imageDto, this.imageIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
            onTap: () => open(context, imageIndex),
            child: Stack(children: [
              Center(
                  child: CachedNetworkImage(
                height: 400,
                width: 400,
                imageUrl: imageDto.url,
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: FavoriteButton(imageDto.isFavorite, imageIndex)
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: Divider())
            ])));
  }

  void open(BuildContext context, final int index) {
    var store = StoreProvider.of<MainState>(context);
    store.dispatch(OpenImageFullscreenAction(index));
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const FullscreenImage()),
    );
  }
}
