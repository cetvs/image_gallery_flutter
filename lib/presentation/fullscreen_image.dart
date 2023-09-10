import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullscreenImage extends StatefulWidget {
  const FullscreenImage({super.key});

  @override
  State<FullscreenImage> createState() => _FullscreenImageState();
}

class _FullscreenImageState extends State<FullscreenImage> {
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
