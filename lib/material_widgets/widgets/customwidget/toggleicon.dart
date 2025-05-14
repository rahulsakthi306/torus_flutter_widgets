import 'package:flutter/material.dart';

class Toggleicon extends StatefulWidget {
  final IconData? activeIcon;
  final IconData? inactiveIcon;
  final String? size;

  const Toggleicon({
    super.key,
    this.activeIcon = Icons.done,
    this.inactiveIcon = Icons.done_all_outlined,
    this.size = 'medium',
  });

  @override
  State<Toggleicon> createState() => _ToggleiconState();
}

class _ToggleiconState extends State<Toggleicon> {
  bool _toggled = false;

  double _mapSize(String sizeLabel) {
    switch (sizeLabel.toLowerCase()) {
      case 'none':
        return 0.0;
      case 'small':
        return 16.0;
      case 'medium':
        return 24.0;
      case 'large':
        return 32.0;
      case 'max':
        return 48.0;
      default:
        return 24.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = _mapSize(widget.size ?? 'medium');
    final iconColor = Theme.of(context).primaryColor;

    return IconButton(
      icon: Icon(
        _toggled
            ? (widget.inactiveIcon ?? Icons.visibility_off)
            : (widget.activeIcon ?? Icons.visibility),
        size: iconSize,
        color: iconColor,
      ),
      onPressed: () {
        setState(() {
          _toggled = !_toggled;
        });
      },
    );
  }
}
