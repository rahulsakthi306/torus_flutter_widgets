import 'package:flutter/material.dart';

class Toggleicon extends StatefulWidget {
  final IconData? iconone;
  final IconData? icontwo;
  final double? size;
  final Color? color;

  const Toggleicon({
    super.key,
    this.iconone =  Icons.favorite_border,
    this.icontwo = Icons.favorite,
    this.size = 30,
    this.color = Colors.red,
  });

  @override
  State<Toggleicon> createState() => _ToggleiconState();
}

class _ToggleiconState extends State<Toggleicon> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _toggled ? (widget.icontwo ?? Icons.visibility_off) : (widget.iconone ?? Icons.visibility),
        size: widget.size ?? 24.0,
        color: widget.color ?? Colors.black,
      ),
      onPressed: () {
        setState(() {
          _toggled = !_toggled;
        });
      },
    );
  }
}
