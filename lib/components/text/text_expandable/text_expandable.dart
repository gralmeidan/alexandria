import 'package:flutter/material.dart';

import 'atoms/animated_arrow.dart';
import 'atoms/collapsable_clip.dart';
import 'atoms/gradient_box.dart';

class TextExpandable extends StatefulWidget {
  final String text;

  const TextExpandable(
    this.text, {
    super.key,
  });

  @override
  State<TextExpandable> createState() => _TextExpandableState();
}

class _TextExpandableState extends State<TextExpandable> with TickerProviderStateMixin {
  late final AnimationController _arrowController;
  late final AnimationController _sizeController;

  bool expanded = false;

  @override
  void initState() {
    super.initState();

    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _sizeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _toggleVisibility() {
    setState(() {
      expanded = !expanded;

      if (expanded) {
        _arrowController.forward();
        _sizeController.forward();
      } else {
        _arrowController.reverse();
        _sizeController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _arrowController.dispose();
    _sizeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      widget.text,
      textAlign: TextAlign.justify,
    );

    if ((textWidget.data?.length ?? 0) <= 400) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: textWidget,
      );
    }

    return InkWell(
      onTap: _toggleVisibility,
      splashFactory: NoSplash.splashFactory,
      child: Stack(
        children: [
          AtomCollapsableClip(
            controller: _sizeController,
            padding: 30,
            child: textWidget,
          ),
          Positioned.fill(
            bottom: 0,
            child: AnimatedOpacity(
              opacity: expanded ? 0 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: const AtomGradientBox(height: 100),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: AtomAnimatedArrow(
                controller: _arrowController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
