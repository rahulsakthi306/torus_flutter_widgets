import 'package:flutter/material.dart';

class TListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final bool isSwitch;
  final bool? isDisabled; 
  final Color? activeTrackColor;
  final Color? trackColor;
  final Color? thumbColor;
  final Color? activeThumbColor;
  final void Function(bool)? onToggle;
  final bool? isChecked;  
  final bool tristate;
  final void Function(bool?)? checkboxOnChanged;
  final MouseCursor? mouseCursor;
  final Color? activeColor;
  final WidgetStateProperty<Color?>? fillColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final FocusNode? focusNode;
  final bool autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final bool isError;
  final String? semanticLabel;

  const TListTile({
    super.key,
    this.title = 'Title',
    this.subtitle = 'Subtitle',
    this.color = Colors.blue,
    this.isSwitch = true,
    this.isDisabled = false,  
    this.activeTrackColor,
    this.trackColor,
    this.thumbColor,
    this.activeThumbColor,
    this.onToggle,
    this.isChecked = false,  
    this.tristate = false,
    this.checkboxOnChanged,
    this.mouseCursor,
    this.activeColor,
    this.fillColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
    this.shape,
    this.side,
    this.isError = false,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: isSwitch
          ? Switch(
              value: isChecked ?? false, 
              onChanged: isDisabled == true ? null : onToggle,
              activeColor: activeThumbColor,
              activeTrackColor: activeTrackColor,
              inactiveThumbColor: thumbColor,
              inactiveTrackColor: trackColor,
            )
          : Checkbox(
              value: isChecked,
              tristate: tristate,
              onChanged: isDisabled == true ? null : checkboxOnChanged,
              activeColor: activeColor ?? color,
              fillColor: fillColor,
              checkColor: checkColor,
              focusColor: focusColor,
              hoverColor: hoverColor,
              overlayColor: overlayColor,
              splashRadius: splashRadius,
              materialTapTargetSize: materialTapTargetSize,
              visualDensity: visualDensity,
              focusNode: focusNode,
              autofocus: autofocus,
              shape: shape,
              side: side,
              isError: isError,
              semanticLabel: semanticLabel,
            ),
    );
  }
}
