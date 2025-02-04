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
  'tonal'
];

List<String> size = ['small', 'medium', 'large', 'block'];

class TDropdown extends StatefulWidget {
  final String type;
  final String size;
  final String? hintText;
  final bool isDisabled;
  final String? label;
  final List<String> items;
  final String? selectedItem;
  final void Function(String?)? onChanged;

  const TDropdown({
    super.key,
    this.type = 'outlined-square',
    this.size = 'medium',
    this.hintText,
    this.isDisabled = false,
    this.label,
    this.items = const [],
    this.selectedItem,
    this.onChanged,
  });

  @override
  State<TDropdown> createState() => _TDropdownState();
}

class _TDropdownState extends State<TDropdown> {
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
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
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
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
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
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
        );
        break;
      case 'icon-circle':
        inputDecoration = InputDecoration(
          prefixIcon: Icon(Icons.arrow_drop_down),
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
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
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
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
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
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
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
        );
        break;
      case 'icon-square':
        inputDecoration = InputDecoration(
          prefixIcon: Icon(Icons.arrow_drop_down),
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.zero,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
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
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
        );
        break;
      case 'underlined-circle':
        inputDecoration = InputDecoration(
          filled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
        );
        break;
      case 'underlined-square':
        inputDecoration = InputDecoration(
          filled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          labelText: widget.label ?? 'Select an option',
          hintText: widget.hintText,
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
          labelText: widget.label ?? '-- Select --',
          hintText: widget.hintText,
        );
    }

    return SizedBox(
      width: size.width,
      height: size.height,
      child: DropdownButtonFormField<String>(
        decoration: inputDecoration,
        value: widget.selectedItem,
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: widget.isDisabled ? null : widget.onChanged,
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
        return Size(double.infinity, 56); // block size
      default:
        return Size(200, 48);
    }
  }
}
