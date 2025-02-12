import 'package:flutter/material.dart';

List<String> position = [ 'left', "right", "top", "bottom" ];
List<String> radioShape = [ 'rounded', 'squared' ];

class TRadio extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String? label;
  final bool isDisabled;
  final String contentPosition;
  final String radioShape;

  const TRadio({
    super.key,
    this.value,
    this.onChanged,
    this.label,
    this.isDisabled = false,
    this.contentPosition = 'right',
    this.radioShape = 'rounded',
  });

  @override
  Widget build(BuildContext context) {
    Widget radioButtonWidget = Radio<bool>(
      value: true, 
      groupValue: value,
      onChanged: isDisabled ? null : onChanged,
    );

    
    switch (contentPosition) {
      case 'left':
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label ?? 'Option'),
            radioButtonWidget,
          ],
        );
      case 'right':
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            radioButtonWidget,
            Text(label ?? 'Option'),
          ],
        );
      case 'top':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label ?? 'Option'),
            radioButtonWidget,
          ],
        );
      case 'bottom':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            radioButtonWidget,
            Text(label ?? 'Option'),
          ],
        );
      default:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            radioButtonWidget,
            Text(label ?? 'Option'),
          ],
        );
    }
  }
}
