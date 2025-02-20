import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/radio.dart';



class CustomRadioButtonGroup extends StatefulWidget {
  final bool isDisable;
  final List<String> options;
  final String contentPosition;
  final String radioAlignment;

  const CustomRadioButtonGroup({
    super.key,
    this.isDisable = false,
    required this.options,
    this.contentPosition = 'right',
    this.radioAlignment = 'vertical',
  });

  @override
  State<CustomRadioButtonGroup> createState() => _CustomRadioButtonGroupState();
}

class _CustomRadioButtonGroupState extends State<CustomRadioButtonGroup> {
  int? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = null; 
  }

  void handleRadioChange(int? value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget radioGroup;

    if (widget.radioAlignment == 'horizontal') {
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
                  : (bool? value) => handleRadioChange(index),
              label: option,
              isDisabled: widget.isDisable,
              contentPosition: widget.contentPosition,
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
                  : (bool? value) => handleRadioChange(index),
              label: option,
              isDisabled: widget.isDisable,
              contentPosition: widget.contentPosition,
            ),
          );
        }).toList(),
      );
    }

    return radioGroup;
  }
}
