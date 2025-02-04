import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final double size;
  final Color? color;
  final Color? bg;

  const CustomCheckbox({
    super.key,
    this.value = false,
    this.size = 24.0,
    this.color,
    this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg ?? Colors.transparent,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: color ?? Colors.blue,
          width: 2.0,
        ),
      ),
      child: Checkbox(
        value: value,
        onChanged: (bool? newValue) {}, 
        activeColor: color ?? Colors.blue,
        checkColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
