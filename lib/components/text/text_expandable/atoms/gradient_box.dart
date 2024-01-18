import 'package:flutter/material.dart';

class AtomGradientBox extends StatelessWidget {
  final double height;
  final List<double> stops;

  const AtomGradientBox({
    super.key,
    required this.height,
    this.stops = const [.2, 1],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: stops,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
          ],
        ),
      ),
    );
  }
}
