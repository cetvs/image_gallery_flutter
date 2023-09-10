import 'package:flutter/material.dart';
import 'package:flutter_app/domain/image_domain.dart';
import 'package:flutter_app/presentation/favorite_button.dart';
import 'package:flutter_app/presentation/fullscreen_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageGallery extends StatelessWidget {
  final ImageDomain imageDomain;
  final int imageIndex;

  const ImageGallery(this.imageDomain, this.imageIndex, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () => open(context, imageIndex),
            child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 180,
                    child: CachedNetworkImage(
                      imageUrl: imageDomain.url,
                      placeholder: (context, url) => const Center(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  Container(
                      height: 40,
                      child: FavoriteButton()
                  )
                ])));
  }

  void open(BuildContext context, final int index) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const FullscreenImage()),
    );
  }
}
