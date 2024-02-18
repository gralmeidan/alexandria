import 'package:flutter/material.dart';

class AtomCollapsableClip extends StatefulWidget {
  final Widget child;
  final AnimationController controller;
  final double padding;
  final double nonCollapsedHeight;
  final Curve curve;

  const AtomCollapsableClip({
    super.key,
    required this.child,
    required this.controller,
    this.padding = 0,
    this.nonCollapsedHeight = 116,
    this.curve = Curves.easeInOutCubic,
  });

  @override
  State<AtomCollapsableClip> createState() => _AtomCollapsableClipState();
}

class _AtomCollapsableClipState extends State<AtomCollapsableClip> {
  final GlobalKey _childKey = GlobalKey();
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  void _afterLayout(_) {
    final renderObject = _childKey.currentContext?.findRenderObject();
    final size = renderObject is RenderBox ? renderObject.size : Size.zero;

    _animation = Tween<double>(
      begin: widget.nonCollapsedHeight,
      end: size.height + widget.padding,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: widget.curve,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        if (_animation == null) {
          return ClipRect(
            child: SizedOverflowBox(
              alignment: Alignment.topCenter,
              size: Size(double.infinity, widget.nonCollapsedHeight),
              child: child,
            ),
          );
        } else {
          return ClipRect(
            child: SizedOverflowBox(
              alignment: Alignment.topCenter,
              size: Size(double.infinity, _animation!.value),
              child: child,
            ),
          );
        }
      },
      child: Container(
        key: _childKey,
        child: widget.child,
      ),
    );
  }
}
