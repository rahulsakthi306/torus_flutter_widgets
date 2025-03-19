import 'package:flutter/material.dart';

List<String> type = [
  'filled-circle',
  'outlined-circle',
  'filled-square',
  'outlined-square',
  'underlined',
];


class TTextArea extends StatefulWidget {
  final String type;
  final String size;
  final String? hintText;
  final bool isDisabled;
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
  final int maxlines;
  final TextInputType? keyboardType;
  final String? fillColor;
  final bool isFloatLabel;
  final IconData? labelPrefix;
  final IconData? labelSuffix;
  final MainAxisAlignment? outerLabelPosition;

  const TTextArea({
    super.key,
    this.type = 'outlined-squaree',
    this.size = 'max',
    this.hintText,
    this.isDisabled = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.top,
    this.showCursor = true,
    this.helperText,
    this.prefix,
    this.suffix,
    this.controller,
    this.onChanged,
    this.validator,
    this.label,
    this.maxlines = 5, 
    this.keyboardType = TextInputType.multiline,
    this.fillColor, 
    this.isFloatLabel = false,
    this.labelPrefix,
    this.labelSuffix,
    this.outerLabelPosition = MainAxisAlignment.start,
  });

  @override
  State<TTextArea> createState() => _TTextAreaState();
}

class _TTextAreaState extends State<TTextArea> {
  @override
  Widget build(BuildContext context) {
    Size size = _getSize(widget.size, widget.maxlines);

    BorderRadius borderRadius;

    if (widget.type.contains('circle')) {
      borderRadius = BorderRadius.circular(10);
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
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          floatingLabelBehavior: !widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
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
          floatingLabelBehavior: !widget.isFloatLabel
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
          contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          floatingLabelBehavior: !widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
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
          floatingLabelBehavior: !widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
        );
        break;
      case 'underlined':
        inputDecoration = InputDecoration(
          filled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          floatingLabelBehavior: !widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
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
          labelText: widget.label ?? 'Enter text here',
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          floatingLabelBehavior: !widget.isFloatLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
        );
    }

    return Visibility(
      visible: true,
      child: Column(
        children: [
          if (!widget.isFloatLabel)
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
        width: size.width,
        child: TextFormField(
          controller: widget.controller,
          decoration: inputDecoration,
          keyboardType: widget.keyboardType,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          showCursor: widget.showCursor,
          enabled: !widget.isDisabled,
          onChanged: widget.onChanged,
          validator: widget.validator,
          maxLines: widget.maxlines),
          ),
        ],
      ),
    );
  }

  Size _getSize(String size, int maxLines) {
  double height;

  switch (size) {
    case 'small':
      height = 100;
      return  Size(150, height);
    case 'medium':
      height = 120;
      return Size(200, height);
    case 'large':
      height = 126;
      return Size(300, height);
    case 'max':
      height = 100;
      return Size(double.infinity, height);
    default:
      height = 48;
  }

  double extendedHeight = height + (maxLines - 1) * 24; 
  return Size(double.infinity, extendedHeight);
}
}
