import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String sizeCategory; 
  final Color? color;
  final Function()? onTap;

  const CustomIconButton({
    super.key,
    this.onTap,
    this.icon = Icons.question_mark,
    this.sizeCategory = 'medium', 
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    double size;

    switch (sizeCategory) {
      case 'small':
        size = 16.0;
        break;
      case 'large':
        size = 32.0;
        break;
      case 'medium':
      default:
        size = 24.0;
        break;
    }

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
