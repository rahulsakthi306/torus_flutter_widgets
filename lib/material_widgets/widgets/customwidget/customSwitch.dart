import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  final bool isDisable;
  final bool isMultiple;

  const CustomSwitchButton({
    super.key,
    this.isDisable = false,
    this.isMultiple = true,
  });

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isOn = true;
  int selectedIndex = 0;

  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (!widget.isMultiple)
          SwitchListTile(
            value: isOn,
            onChanged: widget.isDisable
                ? null
                : (bool value) {
                    setState(() {
                      isOn = value;
                    });
                  },
            title: Text(isOn ? 'Active' : 'Inactive'),
          )
        else
          Column(
            children: options.map((option) {
              int index = options.indexOf(option);
              return SwitchListTile(
                value: selectedIndex == index,
                onChanged: widget.isDisable
                    ? null
                    : (bool value) {
                        setState(() {
                          selectedIndex = value ? index : -1;  
                        });
                      },
                title: Text(option),
              );
            }).toList(),
          ),
      ],
    );
  }
}
