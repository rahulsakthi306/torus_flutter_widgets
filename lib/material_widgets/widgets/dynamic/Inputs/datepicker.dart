import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<String> type = [
  'filled-circle',
  'outlined-circle',
  'filled-square',
  'outlined-square',
  'underlined',
];

class TDatePicker extends StatefulWidget {
  final String type;
  final String size;
  final String? label;
  final String? hintText;
  final bool isDisabled;
  final DateTime? selectedDate;
  final void Function(DateTime?)? onChanged;
  final String? helperText;
  final String? dateFormat;
   final String? fillColor;
  final bool isFloatLabel;
  final IconData? labelPrefix;
  final IconData? labelSuffix;
  final MainAxisAlignment? outerLabelPosition;

  const TDatePicker({
    super.key,
    this.type = 'outlined-square',
    this.size = 'medium',
    this.isDisabled = false,
    this.helperText,
    this.hintText,
    this.selectedDate,
    this.dateFormat,
    this.label,
    this.onChanged,
    this.fillColor, 
    this.isFloatLabel = false,
    this.labelPrefix,
    this.labelSuffix,
    this.outerLabelPosition = MainAxisAlignment.start,
  });

  @override
  State<TDatePicker> createState() => _TDatePickerState();
}

class _TDatePickerState extends State<TDatePicker> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String labelText = widget.label ?? 'Select a date';
    Size size = _getSize(widget.size);

    BorderRadius borderRadius;
    if (widget.type.contains('circle')) {
      borderRadius = BorderRadius.circular(30);
    } else if (widget.type.contains('square')) {
      borderRadius = BorderRadius.zero;
    } else {
      borderRadius = BorderRadius.circular(8);
    }

    Color containerColor;
    switch (widget.fillColor) {
      case "primary":
        containerColor = Theme.of(context).colorScheme.primary;
        break;
      case "secondary":
        containerColor = Theme.of(context).colorScheme.secondary;
        break;
      case "tertiary":
        containerColor = Theme.of(context).colorScheme.tertiary;
        break;
      case "transparent":
        containerColor = Colors.transparent;
        break;
      case "light":
        containerColor = Colors.white;
        break;
      case "dark":
        containerColor = Colors.black;
        break;
      case "greyShade":
        containerColor = Colors.grey.shade200;
        break;
      default:
        containerColor = Colors.transparent;
        break;
    }

    InputDecoration inputDecoration;
    switch (widget.type) {
      case 'filled-circle':
        inputDecoration = InputDecoration(
          filled: true,
          fillColor: containerColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          labelText: labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'outlined-circle':
        inputDecoration = InputDecoration(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          labelText: labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'filled-square':
        inputDecoration = InputDecoration(
          filled: true,
          fillColor: containerColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.zero,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          labelText: labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'outlined-square':
        inputDecoration = InputDecoration(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.zero,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          labelText: labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'underlined':
        inputDecoration = InputDecoration(
          filled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          labelText: labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'underlined-square':
        inputDecoration = InputDecoration(
          filled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          labelText: labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      default:
        inputDecoration = InputDecoration(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          labelText: labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
    }

    return SizedBox(
      width: size.width,
      // height: size.height,
      child: TextFormField(
        controller: TextEditingController(
          text: widget.selectedDate != null ? _formatDate(widget.selectedDate!) : '',
        ),
        decoration: inputDecoration,
        enabled: !widget.isDisabled,
        readOnly: true,
        onTap: !widget.isDisabled ? _selectDate : (){},
      ),
    );
  }

  // Method to show the date picker
  Future<void> _selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      widget.onChanged?.call(selectedDate);
    }
  }

  String _formatDate(DateTime date) {
    String format = widget.dateFormat ?? 'yyyy-MM-dd';
    return DateFormat(format).format(date);
  }

  Size _getSize(String size) {
    switch (size) {
      case 'small':
        return Size(120, 40);
      case 'medium':
        return Size(200, 48);
      case 'large':
        return Size(300, 56);
      case 'max':
        return Size(double.infinity, 56);
      default:
        return Size(200, 48);
    }
  }
}
