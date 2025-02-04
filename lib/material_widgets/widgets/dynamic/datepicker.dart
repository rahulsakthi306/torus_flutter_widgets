import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  const TDatePicker({
    super.key,
    this.type = 'outlined-square',
    this.size = 'medium',
    this.label,
    this.hintText,
    this.isDisabled = false,
    this.selectedDate,
    this.onChanged,
    this.helperText,
    this.dateFormat,
  });

  @override
  State<TDatePicker> createState() => _TDatePickerState();
}

class _TDatePickerState extends State<TDatePicker> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // If a selectedDate is passed, format it for display
    if (widget.selectedDate != null) {
      _controller.text = _formatDate(widget.selectedDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = _getSize(widget.size);

    BorderRadius borderRadius;
    if (widget.type.contains('circle')) {
      borderRadius = BorderRadius.circular(30);
    } else if (widget.type.contains('square')) {
      borderRadius = BorderRadius.zero;
    } else {
      borderRadius = BorderRadius.circular(8);
    }

    InputDecoration inputDecoration;
    switch (widget.type) {
      case 'elevated-circle':
        inputDecoration = InputDecoration(
          filled: true,
          fillColor: Theme.of(context).primaryColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select a date',
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'filled-circle':
        inputDecoration = InputDecoration(
          filled: true,
          fillColor: Theme.of(context).primaryColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select a date',
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
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select a date',
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'icon-circle':
        inputDecoration = InputDecoration(
          prefixIcon: Icon(Icons.calendar_today),
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select a date',
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'elevated-square':
        inputDecoration = InputDecoration(
          filled: true,
          fillColor: Theme.of(context).primaryColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.zero,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
          labelText: widget.label ?? 'Select a date',
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'filled-square':
        inputDecoration = InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.zero,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
          labelText: widget.label ?? 'Select a date',
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
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select a date',
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'icon-square':
        inputDecoration = InputDecoration(
          prefixIcon: Icon(Icons.calendar_today),
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.zero,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select a date',
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'tonal':
        inputDecoration = InputDecoration(
          filled: true,
          fillColor: Colors.blueGrey.shade100,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
          labelText: widget.label ?? 'Select a date',
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
        break;
      case 'underlined-circle':
        inputDecoration = InputDecoration(
          filled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select a date',
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
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select a date',
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
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select a date',
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
    }

    return SizedBox(
      width: size.width,
      height: size.height,
      child: TextFormField(
        controller: _controller,
        decoration: inputDecoration,
        readOnly: true,
        onTap: _selectDate,
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
      setState(() {
        _controller.text = _formatDate(selectedDate);
      });
      widget.onChanged?.call(selectedDate);
    }
  }

  // Format date as a string
  String _formatDate(DateTime date) {
    String format = widget.dateFormat ?? 'yyyy-MM-dd'; // Use provided date format or default
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
      case 'block':
        return Size(double.infinity, 56); // block size
      default:
        return Size(200, 48);
    }
  }
}
