import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  const VideoBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                transform: GradientRotation(0.5),
                colors: [Colors.transparent, Colors.black])),
      ),
    );
  }
}
