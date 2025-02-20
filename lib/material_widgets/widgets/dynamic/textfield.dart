import 'package:flutter/material.dart';

List<String> type = [
  'filled-circle',
  'outlined-circle',
  'filled-square',
  'outlined-square',
  'underlined',
];

class TTextField extends StatefulWidget {
  final String type;
  final String size;
  final String? hintText;
  final bool isDisabled;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final bool showCursor;
  final String? helperText;
  final Widget? prefix;
  final Widget? suffix;
  final String? label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const TTextField({
    super.key,
    this.type = 'outlined-square',
    this.size = 'block',
    this.hintText,
    this.isDisabled = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.showCursor = true,
    this.helperText,
    this.prefix,
    this.suffix,
    this.controller,
    this.onChanged,
    this.validator,
    this.label,
    this.keyboardType,
  });

  @override
  State<TTextField> createState() => _TTextFieldState();
}

class _TTextFieldState extends State<TTextField> {
  final bool _isPassword = true;
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    String labelText = widget.label ?? 'Enter text here';
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
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
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
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
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
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
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
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
        );
        break;
      case 'underlined':
        inputDecoration = InputDecoration(
          filled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
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
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
        );
    }

    if (_isPassword) {
      inputDecoration = inputDecoration.copyWith(
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
      );
    } else {
      setState(() {
        _isObscured = false;
      });
    }

    return SizedBox(
      width: size.width,
      child: TextFormField(
        controller: widget.controller,
        decoration: inputDecoration,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        showCursor: widget.showCursor,
        obscureText: _isObscured,
        enabled: !widget.isDisabled,
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
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
