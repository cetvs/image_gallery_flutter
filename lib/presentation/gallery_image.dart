import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryImage extends StatefulWidget {
  const GalleryImage({super.key});

  @override
  State<GalleryImage> createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  // late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      // currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.pink,
        ),
      );
  }
}
