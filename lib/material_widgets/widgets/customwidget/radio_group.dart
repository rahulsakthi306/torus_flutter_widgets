import 'package:flutter/material.dart';

List<String> position = ['left', "right", "top", "bottom"];

class TRadioGroup extends StatefulWidget {
  final List<String> options;
  final String? groupValue;
  final ValueChanged<String?>? onChanged;
  final String contentPosition;
  final bool isDisabled;

  const TRadioGroup({
    super.key,
    this.options = const ['1','2'],
    this.groupValue,
    this.onChanged,
    this.contentPosition = 'right',
    this.isDisabled = false,
  });

  @override
  State<TRadioGroup> createState() => _TRadioGroupState();
}

class _TRadioGroupState extends State<TRadioGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.options.map((option) {
        return TRadio(
          label: option,
          value: widget.groupValue == option,
          onChanged: widget.isDisabled
              ? null
              : (value) {
                  setState(() {
                    widget.onChanged?.call(option);
                  });
                },
          contentPosition: widget.contentPosition,
          isDisabled: widget.isDisabled,
        );
      }).toList(),
    );
  }
}

class TRadio extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? label;
  final bool isDisabled;
  final String contentPosition;

  const TRadio({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.isDisabled = false,
    this.contentPosition = 'right',
  });

  @override
  Widget build(BuildContext context) {
    Widget radioButtonWidget = Radio<bool>(
      value: true,
      groupValue: value ? true : null,
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
