import 'package:flutter/material.dart';

class SliverFixedHeader extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  SliverFixedHeader({
    required this.child,
    required this.height,
  });

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height; // Adjust this value according to your needs

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverFixedHeader oldDelegate) {
    return child != oldDelegate.child && height != oldDelegate.height;
  }
}
