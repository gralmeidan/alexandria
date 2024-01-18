import 'package:flutter/material.dart';

class ClippedImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  const ClippedImage({
    required this.url,
    this.width = 100,
    this.height = 100,
    this.borderRadius = 8,
    this.fit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
