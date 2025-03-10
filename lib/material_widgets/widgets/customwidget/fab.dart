import 'package:flutter/material.dart';

List<String> type = [
  'elevated-circle',
  'filled-circle',
  'outlined-circle',
  'elevated-square',
  'filled-square',
  'outlined-square',
];

class Floatab extends StatelessWidget {
  final String? label;
  final String type;
  final IconData icon;
  final String? tooltip;
  final void Function()? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? elevation;
  final bool? isExtended;
  final AlignmentGeometry alignment; 

  const Floatab({
    super.key,
    this.label,
    this.type = 'icon-square',
    this.tooltip,
    this.icon = Icons.add,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.elevation,
    this.isExtended = false,
    this.onPressed,
    this.alignment = Alignment.bottomRight, 
  });

  ShapeBorder _getShape(String type) {
    switch (type) {
      case 'elevated-circle':
        return CircleBorder();
      case 'filled-circle':
        return CircleBorder();
      case 'outlined-circle':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.blue));
      case 'icon-circle':
        return CircleBorder();
      case 'elevated-square':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.blue));
      case 'filled-square':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8));
      case 'outlined-square':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.blue));
      default:
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: foregroundColor ?? backgroundColor,
        ),
        label: Text(
          label ?? '',
          style: TextStyle(color: foregroundColor ?? backgroundColor),
        ),
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: _getShape(type),
        isExtended: isExtended ?? false,
        tooltip: tooltip ?? '',
        heroTag: null, 
      ),
    );
  }
}
