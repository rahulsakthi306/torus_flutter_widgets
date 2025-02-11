import 'package:flutter/material.dart';

enum Position { left, right, top, bottom }
enum RadioShape { rounded, squared }
enum RadioAlignment { horizontal, vertical }

class TRadio extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final bool isDisabled;
  final Position contentPosition;
  final RadioShape radioShape;

  const TRadio({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.isDisabled = false,
    this.contentPosition = Position.right,
    this.radioShape = RadioShape.squared, // Default to squared
  });

  @override
  Widget build(BuildContext context) {
    // Create the radio button widget
    Widget radioButtonWidget = Radio<bool>(
      value: true, // Each button has the value `true`
      groupValue: value, // This controls the selected radio button
      onChanged: isDisabled ? null : onChanged, // Call the passed callback
    );

    // Determine the layout based on contentPosition
    switch (contentPosition) {
      case Position.left:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            radioButtonWidget,
          ],
        );
      case Position.right:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            radioButtonWidget,
            Text(label),
          ],
        );
      case Position.top:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            radioButtonWidget,
          ],
        );
      case Position.bottom:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            radioButtonWidget,
            Text(label),
          ],
        );
      default:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            radioButtonWidget,
            Text(label),
          ],
        );
    }
  }
}
