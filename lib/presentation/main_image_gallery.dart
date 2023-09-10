import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import 'gallery_image.dart';

class MainImageGallery extends StatefulWidget {
  const MainImageGallery({super.key, required this.title});

  final String title;

  @override
  State<MainImageGallery> createState() => _MainImageGalleryState();
}

class _MainImageGalleryState extends State<MainImageGallery> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final List<String> images = <String>[
    'https://free-images.com/md/030c/coffee_171653.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (_, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () => open(context, index),
                  child: Container(
                    height: 200,
                    color: Colors.amberAccent,
                    child: PhotoView(imageProvider: AssetImage(images.first)),
                  )
              )
          );
        },
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const GalleryImage()),
    );
  }
}
