import 'package:flutter/material.dart';

class Floatab extends StatefulWidget {
  final String value; 
  final String? label; 
  final IconData icon; 
  final Color? color; 
  final String? tooltip;
  final void Function()? onPressed; 
  final Color? foregroundColor; 
  final Color? backgroundColor; 
  final ShapeBorder? shape; 
  final double? disabledElevation;
  final bool? enableFeedback; 
  final bool? isExtended; 

  const Floatab({
    super.key,
    this.onPressed,
    this.label = 'test',
    this.tooltip,
    this.icon = Icons.edit, 
    this.color,
    this.value = '',
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.shape,
    this.disabledElevation,
    this.enableFeedback,
    this.isExtended = false,
  });

  @override
  _FloatabState createState() => _FloatabState();
}

class _FloatabState extends State<Floatab> {
  bool isAddMode = true;
  double fabElevation = 6.0;

  @override
  void initState() {
    super.initState();
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: widget.onPressed,
        icon: Icon(
          widget.icon,
          color: widget.foregroundColor ?? widget.backgroundColor,
        ),
        label: Text(
          widget.label ?? (isAddMode ? 'Add' : 'Edit'), 
          style: TextStyle(color: widget.foregroundColor ?? widget.backgroundColor),
        ),
        backgroundColor: widget.backgroundColor, 
        elevation: widget.disabledElevation,
        shape: widget.shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        isExtended: widget.isExtended ?? false, 
        tooltip: widget.tooltip ?? (isAddMode ? 'Add Item' : 'Edit Item'),
      ),
    );
  }
}
