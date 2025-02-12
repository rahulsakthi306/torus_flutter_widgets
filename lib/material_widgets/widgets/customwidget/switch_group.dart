import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/switch.dart';

List<String> switchAlignment = [ 'horizontal', 'vertical' ];

class CustomSwitchGroup extends StatefulWidget {
  final bool isDisable;
  final List<String> options;
  final List<String> leftContents;
  final List<String> rightContents;
  final String switchAlignment;
  final String switchShape;

  const CustomSwitchGroup({
    super.key,
    this.isDisable = false,
    required this.options,
    required this.leftContents,
    required this.rightContents,
    this.switchAlignment = 'vertical',
    this.switchShape = 'squared',
  });

  @override
  State<CustomSwitchGroup> createState() => _CustomSwitchGroupState();
}

class _CustomSwitchGroupState extends State<CustomSwitchGroup> {
  List<bool> switchValues = [];

  @override
  void initState() {
    super.initState();
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

    if (widget.switchAlignment == 'horizontal') {
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
