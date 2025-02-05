import 'package:flutter/material.dart';

List<String> type = [
  'elevated-circle',
  'filled-circle',
  'outlined-circle',
  'icon-circle',
  'elevated-square',
  'filled-square',
  'outlined-square',
  'icon-square',
  'tonal',
  'underlined-circle',
  'underlined-square',
];

class Timeinput extends StatefulWidget {
  final String type;
  final String size;
  final String? hintText;
  final bool isDisabled;
  final bool isReadOnly;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final bool showCursor;
  final bool isPassword;
  final String? helperText;
  final Widget? prefix;
  final Widget? suffix;
  final String? label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const Timeinput({
    super.key,
    this.type = 'outlined-square',
    this.size = 'large',
    this.hintText,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.top,
    this.showCursor = true,
    this.isPassword = false,
    this.helperText,
    this.prefix,
    this.suffix,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator ,
    this.label,
  });

  @override
  State<Timeinput> createState() => _TimeinputState();
}

class _TimeinputState extends State<Timeinput> {
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

    InputDecoration inputDecoration = _buildInputDecoration(borderRadius);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: TextFormField(
        controller: widget.controller,
        decoration: inputDecoration,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        showCursor: widget.showCursor,
        obscureText: widget.isPassword,
        enabled: !widget.isDisabled,
        readOnly: widget.isReadOnly,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        // validator: FormBuilderValidators.compose([
        //   FormBuilderValidators
        // ]),
      ),
    );
  }

  InputDecoration _buildInputDecoration(BorderRadius borderRadius) {
    // Common decoration elements
    var decoration = InputDecoration(
      labelText: widget.label ?? 'Enter time',
      hintText: widget.hintText,
      helperText: widget.helperText,
      prefixIcon: widget.prefix,
      suffixIcon: widget.suffix,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
    );

    switch (widget.type) {
      case 'elevated-circle':
      case 'filled-circle':
        return decoration.copyWith(
          filled: true,
          fillColor: Theme.of(context).primaryColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius,
          ),
        );
      case 'outlined-circle':
      case 'icon-circle':
        return decoration.copyWith(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
        );
      case 'elevated-square':
      case 'filled-square':
        return decoration.copyWith(
          filled: true,
          fillColor: widget.type == 'filled-square' ? Colors.grey.shade200 : Theme.of(context).primaryColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.zero,
          ),
        );
      case 'outlined-square':
      case 'icon-square':
        return decoration.copyWith(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.zero,
          ),
        );
      case 'tonal':
        return decoration.copyWith(
          filled: true,
          fillColor: Colors.blueGrey.shade100,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      case 'underlined-circle':
      case 'underlined-square':
        return decoration.copyWith(
          filled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
        );
      default:
        return decoration.copyWith(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
        );
    }
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
