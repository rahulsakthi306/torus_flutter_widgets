import 'package:flutter/material.dart';

List<String> type = [
  'elevated-circle',
  'filled-circle',
  'outlined-circle',
  'elevated-square',
  'filled-square',
  'outlined-square',
];

class Floatab extends StatelessWidget {
  final String? label;
  final String type;
  final IconData icon;
  final String? tooltip;
  final void Function()? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? elevation;
  final bool? isExtended;
  final AlignmentGeometry alignment;
  final bool isExpandableTab;
  final List<Map<String, dynamic>> options;

  const Floatab({
    super.key,
    this.label,
    this.type = 'icon-square',
    this.tooltip,
    this.icon = Icons.add,
    this.foregroundColor = Colors.black,
    this.backgroundColor = Colors.blue,
    this.elevation,
    this.isExtended = false,
    this.onPressed,
    this.alignment = Alignment.bottomRight,
    this.isExpandableTab = false,
    this.options = const [],
  });

  ShapeBorder _getShape(String type) {
    switch (type) {
      case 'elevated-circle':
        return CircleBorder();
      case 'filled-circle':
        return CircleBorder();
      case 'outlined-circle':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.blue));
      case 'icon-circle':
        return CircleBorder();
      case 'elevated-square':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.blue));
      case 'filled-square':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8));
      case 'outlined-square':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.blue));
      default:
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isExpandableTab) {
      return ExpandableFab(
        onPressed: onPressed,
        icon: icon,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        elevation: elevation,
        isExtended: isExtended,
        alignment: alignment,
        tooltip: tooltip,
        label: label,
        type: type,
        options: options,
      );
    } else {
      return Align(
        alignment: alignment,
        child: FloatingActionButton.extended(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: foregroundColor ?? Colors.black,
          ),
          label: Text(
            label ?? '',
            style: TextStyle(color: foregroundColor ?? backgroundColor),
          ),
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: _getShape(type),
          isExtended: isExtended ?? false,
          tooltip: tooltip ?? '',
          heroTag: null,
        ),
      );
    }
  }
}

class ExpandableFab extends StatefulWidget {
  final void Function()? onPressed;
  final IconData icon;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? elevation;
  final bool? isExtended;
  final AlignmentGeometry alignment;
  final String? tooltip;
  final String? label;
  final String type;
  final List<Map<String, dynamic>> options;

  const ExpandableFab({
    super.key,
    this.onPressed,
    this.icon = Icons.add,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.elevation,
    this.isExtended,
    this.alignment = Alignment.bottomRight,
    this.tooltip,
    this.label,
    required this.type,
    required this.options,
  });

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> {
  bool _isOpen = false;

  ShapeBorder _getShape(String type) {
    switch (type) {
      case 'elevated-circle':
        return CircleBorder();
      case 'filled-circle':
        return CircleBorder();
      case 'outlined-circle':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.blue));
      case 'icon-circle':
        return CircleBorder();
      case 'elevated-square':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.blue));
      case 'filled-square':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8));
      case 'outlined-square':
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.blue));
      default:
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Stack(
        children: [
          ...List.generate(widget.options.length, (index) {
            return Positioned(
              bottom: 90 + (index * 70),
              right: 10,
              child: AnimatedOpacity(
                opacity: _isOpen ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Row(
                  children: [
                    Card(child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(widget.options[index]['label']),
                    ),),
                    SizedBox(width: 12,),
                    FloatingActionButton(
                      onPressed: () {
                      },
                      backgroundColor: widget.backgroundColor,
                      shape: _getShape(widget.type),
                      child: Icon(widget.options[index]['icon']),
                    ),
                  ],
                ),
              ),
            );
          }),
          // Main FAB
          Positioned(
            bottom: 20,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _isOpen = !_isOpen;
                });
              },
              backgroundColor: widget.backgroundColor,
              tooltip: widget.tooltip ?? '',
              shape: _getShape(widget.type),
              child: Icon(
                _isOpen ? Icons.close : widget.icon,
                color: widget.foregroundColor ?? Colors.black,
              ), // Apply shape to Main FAB
            ),
          ),
        ],
      ),
    );
  }
}
