import 'package:flutter/material.dart';

class PinInput extends StatefulWidget {
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
  final int pinLength;

  const PinInput({
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
    this.validator,
    this.label,
    this.pinLength = 4,
  });

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.pinLength, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
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

    InputDecoration inputDecoration = _buildInputDecoration(borderRadius);

    return SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.pinLength, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: size.width / widget.pinLength - 8, // distribute space
            child: TextFormField(
              controller: _controllers[index],
              decoration: inputDecoration.copyWith(
                counterText: '', // Remove the character counter
                hintText: widget.hintText ?? '•',
              ),
              keyboardType: widget.keyboardType ?? TextInputType.number,
              textAlign: TextAlign.center,
              textAlignVertical: widget.textAlignVertical,
              showCursor: widget.showCursor,
              obscureText: widget.isPassword,
              enabled: !widget.isDisabled,
              readOnly: widget.isReadOnly,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onFieldSubmitted,
              validator: widget.validator,
            ),
          );
        }),
      ),
    );
  }

  InputDecoration _buildInputDecoration(BorderRadius borderRadius) {
    var decoration = InputDecoration(
      labelText: widget.label ?? 'Enter PIN',
      helperText: widget.helperText,
      prefixIcon: widget.prefix,
      suffixIcon: widget.suffix,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    );

    switch (widget.type) {
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
        return decoration.copyWith(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
        );
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
        return decoration.copyWith(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.zero,
          ),
        );
      case 'underlined':
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
