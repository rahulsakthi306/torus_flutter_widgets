import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String type;
  final String size;
  final String? text;

  const CustomCard({
    super.key,
    this.type = 'filled-circle',
    this.size = 'medium', 
    this.text,
  });

  Size _getSize(String size) {
    switch (size) {
      case 'small':
        return const Size(120, 40);
      case 'medium':
        return const Size(200, 48);
      case 'large':
        return const Size(300, 56);
      case 'block':
        return const Size(double.infinity, 56);
      default:
        return const Size(200, 48);
    }
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration;

    switch (type) {
      case 'filled-circle':
        decoration = BoxDecoration(
          color: Theme.of(context).cardColor,
          shape: BoxShape.circle,
        );
        break;
      case 'outlined-circle':
        decoration = BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
          shape: BoxShape.circle,
        );
        break;
      case 'filled-square':
        decoration = BoxDecoration(
          color: Theme.of(context).cardColor,
          shape: BoxShape.rectangle,
        );
        break;
      case 'outlined-square':
        decoration = BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
          shape: BoxShape.rectangle,
        );
        break;
      case 'underlined':
        decoration = BoxDecoration(
          border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2)),
        );
        break;
      default:
        decoration = BoxDecoration();
        break;
    }

    Size containerSize = _getSize(size);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Container(
        width: containerSize.width,
        height: containerSize.height,
        decoration: decoration,
        child: Center(
          child: Text(
            text ?? 'Sample Text',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
