import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../domain/redux/action.dart';
import '../domain/redux/state.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final int imageIndex;

  const FavoriteButton(this.isFavorite, this.imageIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    // var icon = isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border);
    return IconButton(
      splashRadius: 20,
      icon: Icon(Icons.favorite) ,
      color: Colors.green,
      onPressed: () => _favoritePressed(context),
    );
  }

  Future _favoritePressed(context) async {
    var store = StoreProvider.of<MainState>(context);
    store.dispatch(FavoriteChangeAction(imageIndex, isFavorite));
  }
}
