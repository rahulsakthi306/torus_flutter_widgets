import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<String> type = [
  'filled-circle',
  'outlined-circle',
  'filled-square',
  'outlined-square',
  'underlined',
];

class TDateTimePicker extends StatefulWidget {
  final String type;
  final String size;
  final String? label;
  final String? hintText;
  final bool isDisabled;
  final DateTime? selectedDateTime;
  final void Function(DateTime?)? onChanged;
  final String? helperText;
  final String? datetimeFormat;

  const TDateTimePicker({
    super.key,
    this.type = 'filled-square',
    this.size = 'medium',
    this.label,
    this.hintText,
    this.isDisabled = false,
    this.selectedDateTime,
    this.onChanged,
    this.helperText,
    this.datetimeFormat,
  });

  @override
  State<TDateTimePicker> createState() => _TDateTimePickerState();
}

class _TDateTimePickerState extends State<TDateTimePicker> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.selectedDateTime != null) {
      _controller.text = _formatDateTime(widget.selectedDateTime!);
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
      case 'filled-circle':
        inputDecoration = InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          labelText: widget.label ?? 'Select a date and time',
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
          labelText: widget.label ?? 'Select a date and time',
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
          labelText: widget.label ?? 'Select a date and time',
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
          labelText: widget.label ?? 'Select a date and time',
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
          labelText: widget.label ?? 'Select a date and time',
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
          labelText: widget.label ?? 'Select a date and time',
          hintText: widget.hintText,
          helperText: widget.helperText,
        );
    }

    return SizedBox(
      width: size.width,
      // height: size.height,
      child: TextFormField(
        controller: _controller,
        decoration: inputDecoration,
        readOnly: true,
        enabled: !widget.isDisabled,
        onTap: !widget.isDisabled ? _selectDateAndTime : (){},
      ),
    );
  }

  Future<void> _selectDateAndTime() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(widget.selectedDateTime ?? DateTime.now()),
      );

      if (selectedTime != null) {
        setState(() {
          DateTime combinedDateTime = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
          _controller.text = _formatDateTime(combinedDateTime);
        });
        widget.onChanged?.call(DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        ));
      }
    }
  }

 
  String _formatDateTime(DateTime dateTime) {
    String format = widget.datetimeFormat ?? 'yyyy-MM-dd HH:mm a'; 
    return DateFormat(format).format(dateTime);
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
        return Size(double.infinity, 56); 
      default:
        return Size(200, 48);
    }
  }
}
