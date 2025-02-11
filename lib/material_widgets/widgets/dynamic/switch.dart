import 'package:flutter/material.dart';

enum SwitchShape { rounded, squared }
enum SwitchAlignment { horizontal, vertical }

class TSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;
  final bool isDisabled;
  final String leftContent;
  final String rightContent;
  final SwitchShape switchShape;

  const TSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.isDisabled = false,
    this.leftContent = '',
    this.rightContent = '',
    this.switchShape = SwitchShape.squared, // Default to squared
  });

  @override
  Widget build(BuildContext context) {
    // Create the switch widget with different shapes (rounded or squared)
    Widget switchWidget = Switch(
      value: value,
      onChanged: isDisabled ? null : onChanged,
    );

    // Layout the content
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leftContent.isNotEmpty) ...[
          Text(leftContent),
          SizedBox(width: 8.0),
        ],
        switchWidget,
        if (rightContent.isNotEmpty) ...[
          SizedBox(width: 8.0),
          Text(rightContent),
        ],
      ],
    );
  }
}
