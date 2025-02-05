import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  final double value;
  final String sizeCategory;
  final Color color;
  final Color backgroundColor;

  const CustomProgress({
    super.key,
    this.value = 10.0,
    this.sizeCategory = 'medium', 
    this.color = Colors.blue,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    double size;


    switch (sizeCategory) {
      case 'small':
        size = 30.0;
        break;
      case 'large':
        size = 70.0;
        break;
      case 'medium':
      default:
        size = 50.0;
        break;
    }

    return Container(
      width: size,
      height: size,
      child: Center(
        child: CircularProgressIndicator(
          value: value < 0 || value > 1 ? null : value,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
