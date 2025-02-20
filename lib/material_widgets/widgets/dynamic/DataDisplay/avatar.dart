import 'package:flutter/material.dart';

class TAvatar extends StatefulWidget {
  final String? text;
  final String size;
  final String? imageUrl;
  final IconData? icon;

  const TAvatar({
    super.key,
    this.text,
    this.imageUrl,
    this.size = 'small',
    this.icon,
  });

  @override
  State<TAvatar> createState() => _TAvatarState();
}

class _TAvatarState extends State<TAvatar> {
  
  double _getRadius(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    switch (widget.size) {
      case 'small':
        return screenWidth * 0.06;
      case 'medium':
        return screenWidth * 0.08;
      case 'large':
        return screenWidth * 0.12;
      default:
        return screenWidth * 0.08;
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    switch (widget.size) {
      case 'small':
        return Theme.of(context).textTheme.headlineSmall!;  
      case 'medium':
        return Theme.of(context).textTheme.headlineMedium!; 
      case 'large':
        return Theme.of(context).textTheme.headlineLarge!; 
      default:
        return Theme.of(context).textTheme.headlineSmall!; 
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> words = widget.text != null ? widget.text!.split(' ') : [];
    String initials = '';

    if (words.isNotEmpty) {
      initials += words[0][0].toUpperCase();
      
      if (words.length > 1) {
        initials += words.last[0].toUpperCase();
      }
    }

    ImageProvider? imageProvider;
    if (widget.imageUrl != null) {
      setState(() {
        if (widget.imageUrl!.contains('http') || widget.imageUrl!.contains('https')) {
          imageProvider = NetworkImage(widget.imageUrl!);
        } else {
          imageProvider = AssetImage(widget.imageUrl!);
        }
      });
    }
    
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: _getRadius(context),
        backgroundImage: imageProvider,
        child: widget.icon != null
            ? Icon(widget.icon)
            : initials.isNotEmpty
                ? Text(
                    initials,
                    style: _getTextStyle(context),
                  )
                : null,
      ),
    );
  }
}
