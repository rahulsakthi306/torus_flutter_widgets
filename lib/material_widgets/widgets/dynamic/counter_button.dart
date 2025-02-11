import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final int initialCount;
  final double size;
  final String type;
  final bool isIncrement;
  final bool isDecrement;
  final int incrementCount;  // Step value for increment/decrement

  const CounterButton({
    Key? key,
    this.initialCount = 0,
    this.size = 50.0,
    this.type = 'elevated-circle', // default type
    this.isIncrement = true,
    this.isDecrement = true,
    this.incrementCount = 1,  // Default increment step
  }) : super(key: key);

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _count = widget.initialCount;
  }

  void _increment() {
    if (widget.isIncrement) {
      setState(() {
        _count += widget.incrementCount;
      });
    }
  }

  void _decrement() {
    if (widget.isDecrement) {
      setState(() {
        _count -= widget.incrementCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define the button style based on the 'type' property
    Widget _buildButton(String buttonType, VoidCallback onPressed) {
      double buttonSize = widget.size;
      Color buttonColor = Colors.blue;
      
      switch (buttonType) {
        case 'elevated-circle':
          return ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(buttonSize / 4),
            ),
            child: Icon(Icons.add),
          );
        case 'filled-circle':
          return MaterialButton(
            onPressed: onPressed,
            color: buttonColor,
            shape: CircleBorder(),
            padding: EdgeInsets.all(buttonSize / 4),
            child: Icon(Icons.add, color: Colors.white),
          );
        case 'outlined-circle':
          return OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(buttonSize / 4),
              side: BorderSide(color: buttonColor),
            ),
            child: Icon(Icons.add),
          );
        case 'icon-circle':
          return InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(buttonSize),
            child: Icon(Icons.add, size: buttonSize),
          );
        case 'elevated-square':
          return ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.all(buttonSize / 4),
            ),
            child: Icon(Icons.add),
          );
        case 'filled-square':
          return MaterialButton(
            onPressed: onPressed,
            color: buttonColor,
            shape: RoundedRectangleBorder(),
            padding: EdgeInsets.all(buttonSize / 4),
            child: Icon(Icons.add, color: Colors.white),
          );
        case 'outlined-square':
          return OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.all(buttonSize / 4),
              side: BorderSide(color: buttonColor),
            ),
            child: Icon(Icons.add),
          );
        case 'icon-square':
          return InkWell(
            onTap: onPressed,
            child: Icon(Icons.add, size: buttonSize),
          );
        case 'tonal':
          return IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.add, color: Colors.blueGrey),
          );
        default:
          return ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(buttonSize / 4),
            ),
            child: Icon(Icons.add),
          );
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton(widget.type, _decrement),  // Decrement button
            SizedBox(width: 20),
            Text(
              '$_count',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 20),
            _buildButton(widget.type, _increment),  // Increment button
          ],
        ),
      ],
    );
  }
}
