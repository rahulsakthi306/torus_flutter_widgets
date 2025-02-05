import 'package:flutter/material.dart';

class CustomCheckboxButton extends StatefulWidget {
  final bool isDisable;
  final bool selectedOptions;

  const CustomCheckboxButton({
    super.key,
    this.isDisable = false,
    this.selectedOptions = false,
  });

  @override
  State<CustomCheckboxButton> createState() => _CustomCheckboxButtonState();
}

class _CustomCheckboxButtonState extends State<CustomCheckboxButton> {
  bool isChecked = true;
  
  List<bool> selectedOptions = [false]; 
  
  final List<String> options = ['Option 1', 'Option 2', 'Option 3']; 

  @override
  void initState() {
    super.initState();
    selectedOptions = List<bool>.filled(options.length, false);
  }

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
                  Checkbox(
                    value: selectedOptions[index],
                    onChanged: widget.isDisable
                        ? null
                        : (bool? value) {
                            setState(() {
                              selectedOptions[index] = value!;
                            });
                          },
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
