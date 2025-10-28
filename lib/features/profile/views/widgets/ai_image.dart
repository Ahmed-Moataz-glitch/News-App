import 'package:flutter/material.dart';

class AiImage extends StatelessWidget {
  final String imagePath;
  const AiImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      backgroundImage: AssetImage(imagePath),
    );
  }
}