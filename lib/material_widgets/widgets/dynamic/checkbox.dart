import 'package:flutter/material.dart';

enum Position { left, right, top, bottom }
enum CheckboxShape { rounded, squared }

class TCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final bool isDisabled;
  final Position contentPosition;
  final CheckboxShape checkboxShape;

  const TCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.isDisabled = false,
    this.contentPosition = Position.right,
    this.checkboxShape = CheckboxShape.squared, // Default to squared
  });

  @override
  Widget build(BuildContext context) {
    // Create a checkbox widget with different shapes
    Widget checkboxWidget = Checkbox(
      value: value,
      onChanged: isDisabled ? null : onChanged,
      shape: checkboxShape == CheckboxShape.rounded
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
          : null, // Default shape is square (no border radius)
    );

    // Determine the layout based on contentPosition
    switch (contentPosition) {
      case Position.left:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            checkboxWidget,
          ],
        );
      case Position.right:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkboxWidget,
            Text(label),
          ],
        );
      case Position.top:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            checkboxWidget,
          ],
        );
      case Position.bottom:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkboxWidget,
            Text(label),
          ],
        );
      default:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkboxWidget,
            Text(label),
          ],
        );
    }
  }
}
