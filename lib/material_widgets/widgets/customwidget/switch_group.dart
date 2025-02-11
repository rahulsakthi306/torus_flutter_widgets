import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/switch.dart';

class CustomSwitchGroup extends StatefulWidget {
  final bool isDisable;
  final List<String> options;
  final List<String> leftContents;
  final List<String> rightContents;
  final SwitchAlignment switchAlignment;
  final SwitchShape switchShape;

  const CustomSwitchGroup({
    super.key,
    this.isDisable = false,
    required this.options,
    required this.leftContents,
    required this.rightContents,
    this.switchAlignment = SwitchAlignment.vertical,
    this.switchShape = SwitchShape.squared, // Default to squared
  });

  @override
  State<CustomSwitchGroup> createState() => _CustomSwitchGroupState();
}

class _CustomSwitchGroupState extends State<CustomSwitchGroup> {
  List<bool> switchValues = [];

  @override
  void initState() {
    super.initState();
    // Initialize switchValues to false for each option
    switchValues = List<bool>.filled(widget.options.length, false);
  }

  void handleSwitchChange(int index, bool value) {
    setState(() {
      switchValues[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget switchGroup;

    // Handle layout based on switchAlignment (horizontal or vertical)
    if (widget.switchAlignment == SwitchAlignment.horizontal) {
      switchGroup = Row(
        children: widget.options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TSwitch(
              value: switchValues[index],
              onChanged: widget.isDisable
                  ? (bool? val){}
                  : (bool value) => handleSwitchChange(index, value),
              label: option,
              isDisabled: widget.isDisable,
              leftContent: widget.leftContents[index],
              rightContent: widget.rightContents[index],
              switchShape: widget.switchShape,
            ),
          );
        }).toList(),
      );
    } else {
      switchGroup = Column(
        children: widget.options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TSwitch(
              value: switchValues[index],
              onChanged: widget.isDisable
                  ? (bool? val){}
                  : (bool value) => handleSwitchChange(index, value),
              label: option,
              isDisabled: widget.isDisable,
              leftContent: widget.leftContents[index],
              rightContent: widget.rightContents[index],
              switchShape: widget.switchShape,
            ),
          );
        }).toList(),
      );
    }

    return switchGroup;
  }
}
