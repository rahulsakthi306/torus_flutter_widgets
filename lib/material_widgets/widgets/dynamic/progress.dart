import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  final double value;
  final double size;
  final Color color;
  final Color backgroundColor;

  const CustomProgress({
    super.key,
    this.value = 10.0,
    this.size = 50.0, 
    this.color = Colors.blue,
    this.backgroundColor = Colors.grey, 
  });

  @override
  Widget build(BuildContext context) {
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
