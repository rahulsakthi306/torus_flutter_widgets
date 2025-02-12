import 'package:flutter/material.dart';

List<String> types = [
  'filled-rounded', 'filled-square', 'outlined-rounded', 'outlined-square',
  'elevated-rounded', 'elevated-square'
];

class TCard extends StatelessWidget {
  final String type;
  final String size;
  final String? text;

  const TCard({
    super.key,
    this.type = 'filled-square',
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
      case 'filled-square':
        decoration = BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.rectangle, 
        );
        break;
      case 'outlined-square':
        decoration = BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          shape: BoxShape.rectangle, 
        );
        break;
      case 'filled-rounded':
        decoration = BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12), 
        );
        break;
      case 'outlined-rounded':
        decoration = BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(12),
        );
        break;
      case 'elevated-rounded':
        decoration = BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12), 
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        );
        break;
      case 'elevated-square':
        decoration = BoxDecoration(
          color: Theme.of(context).cardColor,
          shape: BoxShape.rectangle, 
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
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
      elevation: type.startsWith('elevated') ? 5 : 0,
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

