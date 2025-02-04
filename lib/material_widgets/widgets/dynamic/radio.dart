import 'package:flutter/material.dart';

class radioButton extends StatefulWidget {
  final double size; 
  final Color? selectedColor; 
  final Color? unselectedColor; 

  const radioButton({
    super.key,
    this.size = 60.0,
    this.selectedColor,
    this.unselectedColor,
  });

  @override
  _RadioProgressState createState() => _RadioProgressState();
}

class _RadioProgressState extends State<radioButton> {
  double _selectedValue = 0.0;

  void _toggleSelection(double value) {
    setState(() {
      if (_selectedValue == value) {
        _selectedValue = 0.0; 
      } else {
        _selectedValue = value; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: 
      
      
       List.generate(5, (index) {
        double value = index + 1.0; // Values from 1 to 5
        return GestureDetector(
          onTap: () => _toggleSelection(value),
          child: Container(
            margin: const EdgeInsets.all(4.0),
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _selectedValue == value
                  ? widget.selectedColor ?? Colors.blue
                  : widget.unselectedColor ?? Colors.grey.shade200,
              border: Border.all(
                color: _selectedValue == value
                    ? widget.selectedColor ?? Colors.blue
                    : Colors.transparent,
                width: 2.0,
              ),
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                  color: _selectedValue == value
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
