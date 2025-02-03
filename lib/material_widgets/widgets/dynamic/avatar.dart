import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/enums/enums.dart';

class TAvatar extends StatelessWidget {
  final String? text;
  final AvatarSize? size;
  final String? imageUrl;
  final TImageType? imageType;
  final IconData? icon;

  const TAvatar({super.key, this.text, this.imageUrl, this.size, this.imageType, this.icon});

  double _getRadius() {
    switch (size) {
      case AvatarSize.small:
        return 30.0;
      case AvatarSize.medium:
        return 50.0;
      case AvatarSize.large:
        return 70.0;
      default:
        return 30.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> words = text != null ? text!.split(' ') : [];
    String initials = '';
    
    for (var word in words) {
      if (word.isNotEmpty) {
        initials += word[0].toUpperCase();
      }
    }

    ImageProvider? imageProvider;
    if (imageUrl != null && imageType != null) {
      if (imageType == TImageType.network) {
        imageProvider = NetworkImage(imageUrl!);
      } else if (imageType == TImageType.asset) {
        imageProvider = AssetImage(imageUrl!);
      }
    }

    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: _getRadius(),
        backgroundImage: imageProvider,
        child : icon != null
            ? Icon(icon)
            : initials.isNotEmpty
                ? Text(
                    initials,
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                : null,
      ),
    );
  }
}
