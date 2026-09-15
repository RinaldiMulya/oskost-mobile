import 'dart:ui';

import 'package:flutter/material.dart';

class AppPill extends StatelessWidget {
  final Widget child;
  final Color background;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const AppPill({
    super.key,
    required this.child,
    required this.background,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  });

  @override
  Widget build(BuildContext context) {
    final bool isGlass = background == Colors.transparent || background.a < 1.0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: isGlass ? 4.0 : 0.0,
          sigmaY: isGlass ? 2.0 : 0.0,
        ),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(borderRadius),
            border: isGlass
                ? Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                    width: 1.0,
                  )
                : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
