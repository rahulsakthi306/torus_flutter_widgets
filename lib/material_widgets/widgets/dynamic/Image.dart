import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath; 
  final double size;
  final Function()? onTap;

  const CustomImage({
    super.key,
    this.onTap,
    this.imagePath = 'assets/image/upload.png', 
    this.size = 10.0, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
