import 'package:flutter/material.dart';

class TImage extends StatefulWidget {
  final String? imageUrl;
  final String size;
  final Function()? onTap;

  const TImage({
    super.key,
    this.onTap,
    this.imageUrl,
    this.size = 'medium',
  });

  @override
  State<TImage> createState() => _TImageState();
}

class _TImageState extends State<TImage> {
  @override
  Widget build(BuildContext context) {
    double imageSize;
    String? type;
    if (widget.imageUrl!.contains('http') ||
        widget.imageUrl!.contains('https')) {
      setState(() {
        type = 'network';
      });
    } else {
      setState(() {
        type = 'asset';
      });
    }
    switch (widget.size) {
      case 'small':
        imageSize = 24.0;
        break;
      case 'large':
        imageSize = 48.0;
        break;
      case 'medium':
      default:
        imageSize = 36.0;
        break;
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: type == 'asset' && type != null
          ? Image.asset(
              widget.imageUrl ?? 'assets/image/upload.png',
              width: imageSize,
              height: imageSize,
              fit: BoxFit.contain,
            )
          : type == 'network' && type != null
              ? Image.network(
                  widget.imageUrl ?? '',
                  width: imageSize,
                  height: imageSize,
                )
              : Container(),
    );
  }
}
