import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final String sizeCategory; 
  final Function()? onTap;

  const CustomImage({
    super.key,
    this.onTap,
    this.imagePath = 'assets/image/upload.png',
    this.sizeCategory = 'medium', 
  });

  @override
  Widget build(BuildContext context) {
    double size;

  
    switch (sizeCategory) {
      case 'small':
        size = 24.0;
        break;
      case 'large':
        size = 48.0;
        break;
      case 'medium':
      default:
        size = 36.0;
        break;
    }

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
