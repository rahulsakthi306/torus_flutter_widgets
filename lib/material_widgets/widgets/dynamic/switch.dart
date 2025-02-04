import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final bool isDisable;
  final bool isMultiple; 
  
  const CustomRadioButton({
    super.key,
    this.isDisable = false,
    this.isMultiple = true, 
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  bool isOn = true; 
  int selectedIndex = 0;

 
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (!widget.isMultiple) 
          RadioListTile<bool>(
            value: true,
            groupValue: isOn,
            onChanged: widget.isDisable
                ? null
                : (bool? value) {
                    if (value != null) {
                      setState(() {
                        isOn = value;
                      });
                    }
                  },
            title: Text(isOn ? 'Active' : 'Inactive'),
          )
        else
          Column(
            children: options.map((option) {
              int index = options.indexOf(option);
              return RadioListTile<int>(
                value: index,
                groupValue: selectedIndex,
                onChanged: widget.isDisable
                    ? null
                    : (int? value) {
                        if (value != null) {
                          setState(() {
                            selectedIndex = value;
                          });
                        }
                      },
                title: Text(option),
              );
            }).toList(),
          ),
      ],
    );
  }
}
