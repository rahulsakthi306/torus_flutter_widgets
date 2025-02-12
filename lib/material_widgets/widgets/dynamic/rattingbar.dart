import 'package:flutter/material.dart';

class TRatingBar extends StatelessWidget {
  final double rating; 
  final double size; 
  final Color? filledColor; 
  final Color? emptyColor; 

  const TRatingBar({
    super.key,
    this.rating = 5.0,
    this.size = 30.0,
    this.filledColor,
    this.emptyColor,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    double fractionalStar = rating - fullStars;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return Icon(
            Icons.star,
            size: size,
            color: filledColor ?? Colors.yellow,
          );
        } else if (index == fullStars && fractionalStar > 0) {
          return Icon(
            Icons.star_half,
            size: size,
            color: filledColor ?? Colors.yellow,
          );
        } else {
          return Icon(
            Icons.star_border,
            size: size,
            color: emptyColor ?? Colors.grey,
          );
        }
      }),
    );
  }
}
