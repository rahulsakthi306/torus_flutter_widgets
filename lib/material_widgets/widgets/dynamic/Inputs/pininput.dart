import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TPinInput extends StatefulWidget {
  final String type;
  final String size;
  final String? hintText;
  final bool isDisabled;
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
  final String? Function(String?)? validator;
  final int pinLength;

  const TPinInput({
    super.key,
    this.type = 'outlined-square',
    this.size = 'medium',
    this.hintText,
    this.isDisabled = false,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.showCursor = true,
    this.isPassword = false,
    this.helperText,
    this.prefix,
    this.suffix,
    this.controller,
    this.onChanged,
    this.validator,
    this.label,
    this.pinLength = 4,
  });

  @override
  State<TPinInput> createState() => _TPinInputState();
}

class _TPinInputState extends State<TPinInput> {
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
            width: size.width / widget.pinLength - 8, 
            child: TextFormField(
              controller: _controllers[index],
              decoration: inputDecoration.copyWith(
                counterText: '',
                hintText: widget.hintText ?? '•',
              ),
              inputFormatters: [               
                  FilteringTextInputFormatter.digitsOnly,
              ],
              maxLength: 1,
              keyboardType: widget.keyboardType ?? TextInputType.number,
              textAlign: TextAlign.center,
              textAlignVertical: widget.textAlignVertical,
              showCursor: widget.showCursor,
              obscureText: widget.isPassword,
              enabled: !widget.isDisabled,
              onChanged: widget.onChanged,
              validator: widget.validator,
            ),
          );
        }),
      ),
    );
  }

  InputDecoration _buildInputDecoration(BorderRadius borderRadius) {
    var decoration = InputDecoration(
      labelText: widget.label,
      helperText: widget.helperText,
      prefixIcon: widget.prefix,
      suffixIcon: widget.suffix,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    );

    switch (widget.type) {
      case 'filled-circle':
        return decoration.copyWith(
          filled: true,
          fillColor: widget.type == 'filled-circle' ? Colors.grey.shade200 : Theme.of(context).primaryColor,
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
        return Size(200, 56);
      case 'medium':
        return Size(250, 56);
      case 'large':
        return Size(300, 56);
      case 'max':
        return Size(350, 56);
      default:
        return Size(200, 48);
    }
  }
}
