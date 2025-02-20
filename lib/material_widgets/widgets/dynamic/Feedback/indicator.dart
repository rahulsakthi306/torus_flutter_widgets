import 'package:flutter/material.dart';

class ProgressIndicator extends StatelessWidget {
  final double value;
  final String sizeCategory;
  final Color color;
  final Color backgroundColor;
  final String type; 

  const ProgressIndicator({
    super.key,
    this.value = 10.0,
    this.sizeCategory = 'medium', 
    this.color = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.type = 'linear',
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

    if (type == 'linear') {
      return Container(
        width: size,
        height: 10.0,
        child: LinearProgressIndicator(
          value: value < 0 || value > 1 ? null : value,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          backgroundColor: backgroundColor,
        ),
      );
    } else {
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
}
