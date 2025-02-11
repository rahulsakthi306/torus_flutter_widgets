import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/radio.dart';

class CustomRadioButtonGroup extends StatefulWidget {
  final bool isDisable;
  final List<String> options;
  final Position contentPosition;
  final RadioAlignment radioAlignment;
  final RadioShape radioShape;

  const CustomRadioButtonGroup({
    super.key,
    this.isDisable = false,
    required this.options,
    this.contentPosition = Position.right,
    this.radioAlignment = RadioAlignment.vertical,
    this.radioShape = RadioShape.squared, // Default to squared
  });

  @override
  State<CustomRadioButtonGroup> createState() => _CustomRadioButtonGroupState();
}

class _CustomRadioButtonGroupState extends State<CustomRadioButtonGroup> {
  int? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = null; // Initially, no radio button is selected
  }

  void handleRadioChange(int? value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget radioGroup;

    // Handle layout based on radioAlignment (horizontal or vertical)
    if (widget.radioAlignment == RadioAlignment.horizontal) {
      radioGroup = Row(
        children: widget.options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TRadio(
              value: selectedValue == index,
              onChanged: widget.isDisable
                  ? (bool? val){}
                  : (bool? value) => handleRadioChange(index), // Pass index as value
              label: option,
              isDisabled: widget.isDisable,
              contentPosition: widget.contentPosition,
              radioShape: widget.radioShape,
            ),
          );
        }).toList(),
      );
    } else {
      radioGroup = Column(
        children: widget.options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TRadio(
              value: selectedValue == index,
              onChanged: widget.isDisable
                  ? (bool? val){}
                  : (bool? value) => handleRadioChange(index), // Pass index as value
              label: option,
              isDisabled: widget.isDisable,
              contentPosition: widget.contentPosition,
              radioShape: widget.radioShape,
            ),
          );
        }).toList(),
      );
    }

    return radioGroup;
  }
}
