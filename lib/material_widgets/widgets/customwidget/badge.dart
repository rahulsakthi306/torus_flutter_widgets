import 'package:flutter/material.dart';

class TBadge extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final double? smallSize;
  final double? largeSize;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Offset? offset;
  final Widget? label;
  final bool isLabelVisible;
  final Widget? child;
  final int? count; 

  const TBadge({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.smallSize,
    this.largeSize,
    this.textStyle,
    this.padding,
    this.alignment,
    this.offset,
    this.label,
    this.child,
    this.isLabelVisible = true,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Badge(
              label: label,
              backgroundColor: backgroundColor ?? Colors.red,
              textColor: textColor ?? Colors.white,
              padding: padding ?? const EdgeInsets.all(6),
              alignment: alignment ?? Alignment.topRight,
              offset: offset ?? Offset(0, 0),
              textStyle: textStyle,
              isLabelVisible: isLabelVisible,
              child: const Icon(Icons.receipt),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Badge.count(
              count: count ?? 0,
              backgroundColor: backgroundColor ?? Colors.green,
              textColor: textColor ?? Colors.white,
              padding: padding ?? const EdgeInsets.all(3),
              alignment: alignment ?? Alignment.topRight,
              offset: offset ?? Offset(0, 0),
              textStyle: textStyle,
              isLabelVisible: isLabelVisible,
              child: const Icon(Icons.notifications),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: child ?? const Icon(Icons.person, size: 50),
      ),
    );
  }
}
