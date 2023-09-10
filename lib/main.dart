import 'package:flutter/material.dart';
import 'package:flutter_app/domain/redux/state.dart';
import 'package:flutter_app/presentation/main_image_gallery.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'domain/redux/reducer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store(mainReducer,
      initialState: MainState.initialState(), middleware: [thunkMiddleware]);

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const MainImageGallery(title: 'Flutter Demo Home Page'),
        ));
  }
}
