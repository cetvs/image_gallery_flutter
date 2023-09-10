import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  // final ImageDomain photoItem;
  // final int index;

  const FavoriteButton(
      // this.photoItem, this.index,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      icon: const Icon(Icons.favorite),
      color: Colors.green,
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {}
}
