import 'package:flutter/material.dart';

List<String> progressBarSize = [ 'small', 'medium', 'large', 'block' ];

class TProgressbar extends StatefulWidget {
  final double? value;  // Progress value (0.0 to 1.0)
  final String type;  // Type of progress bar: 'linear' or 'circular'
  final Color color;
  final Color backgroundColor;
  final String size;

  const TProgressbar({
    super.key,
    this.value,
    this.type = 'linear',
    this.color = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.size = 'medium',
  });

  @override
  State<TProgressbar> createState() => _TProgressbarState();
}

class _TProgressbarState extends State<TProgressbar> {
  @override
  Widget build(BuildContext context) {
    double progressBarSize = _getSize();

    if (widget.type == 'linear') {
      return SizedBox(
        width: progressBarSize,
        height: 14.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: LinearProgressIndicator(
            value: widget.value != null ? widget.value!.clamp(0.0, 1.0) : 0.0,
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            backgroundColor: widget.backgroundColor,
          ),
        ),
      );
    }

    return SizedBox(
      width: progressBarSize,
      height: 14.0,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(widget.backgroundColor),
              strokeWidth: 8.0,
              backgroundColor: Colors.transparent,
            ),
            CircularProgressIndicator(
              value: widget.value != null ? widget.value!.clamp(0.0, 1.0) : 0.0,
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              strokeWidth: 8.0,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  double _getSize() {
    switch (widget.size) {
      case 'small':
        return 30.0;
      case 'medium':
        return 70.0;
      case 'large':
        return 100.0;
      case 'block':
        return double.infinity;
      default:
        return 50.0;
    }
  }
}
