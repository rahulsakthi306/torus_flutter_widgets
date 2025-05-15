import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
  final bool isFloatLabel;
  final IconData? labelPrefix;
  final IconData? labelSuffix;
  final MainAxisAlignment? outerLabelPosition;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? fillColor;
  final bool isPhoneField;
  final FocusNode? focusNode;

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
    this.isFloatLabel = true,
    this.labelPrefix,
    this.labelSuffix = Icons.account_balance,
    this.outerLabelPosition = MainAxisAlignment.start,
    this.fillColor, 
    this.isPhoneField = false,
    this.focusNode,
  });

  @override
  State<TTextField> createState() => _TTextFieldState();
}

class _TTextFieldState extends State<TTextField> {
  final bool _isPassword = false;
  bool _isObscured = false;

  @override
  Widget build(BuildContext context) {
    String? labelText = widget.isFloatLabel ? widget.label ?? 'Enter text here' : null;
    Size size = _getSize(widget.size);
    BorderRadius borderRadius;

    if (widget.type.contains('circle')) {
      borderRadius = BorderRadius.circular(30);
    } else if (widget.type.contains('square')) {
      borderRadius = BorderRadius.zero;
    } else {
      borderRadius = BorderRadius.circular(8);
    }

    // Determine the fill color based on fillColor
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
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          floatingLabelBehavior: widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
        );
        break;
      case 'outlined-circle':
        inputDecoration = InputDecoration(
          filled: false,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          floatingLabelBehavior: widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
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
          contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          floatingLabelBehavior: widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
        );
        break;
      case 'outlined-square':
        inputDecoration = InputDecoration(
          filled: false,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.zero,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          floatingLabelBehavior: widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
        );
        break;
      case 'underlined':
        inputDecoration = InputDecoration(
          filled: false,
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          floatingLabelBehavior: widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
        );
        break;
      default:
        inputDecoration = InputDecoration(
          filled: false,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          labelText: labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          floatingLabelBehavior: widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
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

    void _onTap() {}

    return Column(
      children: [
        if (widget.isFloatLabel)
          Row(
            mainAxisAlignment: widget.outerLabelPosition ?? MainAxisAlignment.start,
            children: [
              if (widget.labelPrefix != null) Icon(widget.labelPrefix),
              SizedBox(width: 8),
              Text(widget.label ?? ''),
              SizedBox(width: 8),
              if (widget.labelSuffix != null) Icon(widget.labelSuffix),
            ],
          ),
        SizedBox(height: 8),

        SizedBox(
      width: double.infinity,
      child: widget.isPhoneField
          ? IntlPhoneField(
              focusNode: widget.focusNode,
              controller: widget.controller,
              decoration: inputDecoration.copyWith(
                labelText: widget.label ?? 'Phone Number',
              ),
              initialCountryCode: 'US',
              languageCode: "en",
              enabled: !widget.isDisabled,
              onChanged: (phone) => widget.onChanged?.call(phone.completeNumber),
              onCountryChanged: (country) {
                print('Country changed to: ${country.name}');
              },
            )
          : TextFormField(
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
              onTap: 
               _onTap
              
            ),
    ),
        // SizedBox(
        //   width: size.width,
        //   child: TextFormField(
        //       controller: widget.controller,
        //       decoration: inputDecoration,
        //       keyboardType: widget.keyboardType,
        //       textAlign: widget.textAlign,
        //       textAlignVertical: widget.textAlignVertical,
        //       showCursor: widget.showCursor,
        //       obscureText: _isObscured,
        //       enabled: !widget.isDisabled,
        //       onChanged: widget.onChanged,
        //       validator: widget.validator,
        //       onTap: _onTap),
        // ),
      ],
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
