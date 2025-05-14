import 'package:flutter/material.dart';

class CustomCheckboxGroup extends StatefulWidget {
  final bool isDisabled;
  final List<String> options;
  final String contentPosition; 
  final String checkboxAlignment; 
  final ValueChanged<List<bool>>? onChanged;
  final String? label;
  final bool required;
  

  const CustomCheckboxGroup({
    super.key,
    this.isDisabled = false,
    this.options = const ['option1','option2','option3','option4'],
    this.contentPosition = 'right',
    this.checkboxAlignment = 'vertical',
    this.onChanged,
    this.label, 
    this.required = false,

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

    if (widget.onChanged != null) {
      widget.onChanged!(values);
    }
  }

  Widget _buildCheckbox(int index, String option) {
    final checkbox = Checkbox(
      value: values[index],
      onChanged: widget.isDisabled ? null : (value) => handleCheckboxChange(index, value),
    );

    final label = Text(option);

    return GestureDetector(
    onTap: widget.isDisabled
        ? null
        : () => handleCheckboxChange(index, !values[index]),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: widget.contentPosition == 'left'
          ? Row(mainAxisSize: MainAxisSize.min, children: [label, checkbox])
          : Row(mainAxisSize: MainAxisSize.min, children: [checkbox, label]),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    final children = widget.options
        .asMap()
        .entries
        .map((entry) => _buildCheckbox(entry.key, entry.value))
        .toList();

    return widget.checkboxAlignment == 'horizontal'
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: children),
          )
        : Column(crossAxisAlignment: CrossAxisAlignment.start,children: children);
  }
}
