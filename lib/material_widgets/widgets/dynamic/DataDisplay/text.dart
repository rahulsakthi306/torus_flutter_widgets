import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final String textTheme;

  const CommonTextWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.textTheme = 'labelMedium',
  });

  @override
  Widget build(BuildContext context) {

    TextStyle themeTextStyle = _getTextThemeStyle(textTheme);

    return Text(
      text,
      style: textStyle ?? themeTextStyle,
    );
  }

  TextStyle _getTextThemeStyle(String theme) {
    switch (theme) {
      case 'displayLarge':
        return TextStyle(fontSize: 57, fontWeight: FontWeight.bold);
      case 'displayMedium':
        return TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
      case 'displaySmall':
        return TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
      case 'headlineLarge':
        return TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
      case 'headlineMedium':
        return TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
      case 'headlineSmall':
        return TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
      case 'titleLarge':
        return TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
      case 'titleMedium':
        return TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
      case 'titleSmall':
        return TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
      case 'labelLarge':
        return TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
      case 'labelMedium':
        return TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
      case 'labelSmall':
        return TextStyle(fontSize: 11, fontWeight: FontWeight.normal);
      case 'bodyLarge':
        return TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
      case 'bodyMedium':
        return TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
      case 'bodySmall':
        return TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
      default:
        return TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
    }
  }
}
