import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final bool isDisable;
  final bool isMultiple;
  final void Function(int?)? onChanged;

  const CustomRadioButton({
    super.key,
    this.isDisable = false,
    this.isMultiple = true, 
    this.onChanged,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int selectedIndex = 0; 

  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Column(
            children: options.asMap().entries.map((entry) {
              int index = entry.key;
              String option = entry.value;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<int>(
                    value: index,
                    groupValue: selectedIndex,
                    onChanged: widget.isDisable
                        ? null
                        : widget.onChanged
                  ),
                  Text(option),
                ],
              );
            }).toList(),
          ),
      ],
    );
  }
}
