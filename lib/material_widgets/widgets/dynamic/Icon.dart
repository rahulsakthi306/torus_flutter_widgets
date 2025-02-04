import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  final Function()? onTap;

  const CustomIconButton({
    super.key,
    this.onTap,
    this.icon = Icons.question_mark,
    this.size = 24.0,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
