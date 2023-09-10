import 'package:flutter/material.dart';
import 'package:flutter_app/domain/image_domain.dart';
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
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () => open(context, imageIndex),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 300,
                    child: CachedNetworkImage(
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Container(
                      height: 40,
                      alignment: Alignment.bottomRight,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: FavoriteButton(imageDto.isFavorite, imageIndex))),
                  const Divider()
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
