import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/checkbox.dart';

List<String> checkboxAlignment = [ 'horizontal', 'vertical' ];

class CustomCheckboxGroup extends StatefulWidget {
  final bool isDisable;
  final List<String> options;
  final String contentPosition;
  final String checkboxAlignment;
  final String checkboxShape; 

  const CustomCheckboxGroup({
    super.key,
    this.isDisable = false,
    required this.options,
    this.contentPosition = 'right',
    this.checkboxAlignment = 'vertical',
    this.checkboxShape = 'squared', 
  });

  @override
  State<CustomCheckboxGroup> createState() => _CustomCheckboxGroupState();
}

class _CustomCheckboxGroupState extends State<CustomCheckboxGroup> {
  late List<bool> values;

  @override
  void initState() {
    super.initState();
    values = List<bool>.filled(widget.options.length, false);
  }

  void handleCheckboxChange(int index, bool? value) {
    setState(() {
      values[index] = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget checkboxGroup;
    
    if (widget.checkboxAlignment == 'horizontal') {
      checkboxGroup = Row(
        children: widget.options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TCheckbox(
              value: values[index],
              onChanged: widget.isDisable
                  ? (bool? value) {}
                  : (bool? value) => handleCheckboxChange(index, value),
              label: option,
              isDisabled: widget.isDisable,
              contentPosition: widget.contentPosition,
              checkboxShape: widget.checkboxShape,
            ),
          );
        }).toList(),
      );
    } else {
      checkboxGroup = Column(
        children: widget.options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TCheckbox(
              value: values[index],
              onChanged: widget.isDisable
                  ? (bool? value) {}
                  : (bool? value) => handleCheckboxChange(index, value),
              label: option,
              isDisabled: widget.isDisable,
              contentPosition: widget.contentPosition,
              checkboxShape: widget.checkboxShape,
            ),
          );
        }).toList(),
      );
    }

    return checkboxGroup;
  }
}
