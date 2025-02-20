import 'package:flutter/material.dart';

List<String> contentPosition = [ 'left', 'right', 'top', 'bottom' ];
List<String> checkboxShape = [ 'rounded', 'squared' ];

class TCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String? label;
  final bool isDisabled;
  final String contentPosition;
  final String checkboxShape;

  const TCheckbox({
    super.key,
    this.value,
    this.onChanged,
    this.label,
    this.isDisabled = false,
    this.contentPosition = 'right',
    this.checkboxShape = 'squared',
  });

  @override
  Widget build(BuildContext context) {
    Widget checkboxWidget = Checkbox(
      value: value,
      onChanged: isDisabled ? null : onChanged,
      shape: checkboxShape == 'rounded'
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
          : null,
    );

    switch (contentPosition) {
      case 'left':
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label ?? ''),
            checkboxWidget,
          ],
        );
      case 'right':
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkboxWidget,
            Text(label ?? ''),
          ],
        );
      case 'top':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label ?? ''),
            checkboxWidget,
          ],
        );
      case 'bottom':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkboxWidget,
            Text(label ?? ''),
          ],
        );
      default:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkboxWidget,
            Text(label ?? ''),
          ],
        );
    }
  }
}
