import 'package:flutter/material.dart';

class AtomAnimatedArrow extends StatefulWidget {
  final AnimationController controller;
  final Curve curve;

  const AtomAnimatedArrow({
    super.key,
    required this.controller,
    this.curve = Curves.easeInOutCubic,
  });

  @override
  State<AtomAnimatedArrow> createState() => _AtomAnimatedArrowState();
}

class _AtomAnimatedArrowState extends State<AtomAnimatedArrow> {
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animation = Tween<double>(begin: 1, end: -1).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: widget.curve,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return Transform.scale(
          scaleY: _animation.value,
          child: const Icon(Icons.expand_more_rounded),
        );
      },
    );
  }
}
