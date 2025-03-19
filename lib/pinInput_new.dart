import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

List<String> type = [
  'filledCircle',
  'outlinedCircle',
  'filledSquare',
  'outlinedSquare',
  'underlined',
];

class PinInputCustom extends StatefulWidget {
  final String type;
  final String? label;
  final int pinLength;
  final bool showCursor;
  final bool obscureText;
  final bool smsAutoFill;
  final bool isDisabled;
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
   final String? labelPosition;
   final Widget? labelPrefix;
  final Widget? labelSuffix; 

  const PinInputCustom({
    super.key,
    this.type = 'underlined',
    this.pinLength = 4,
    this.showCursor = false,
    this.obscureText = false,
    this.onCompleted,
    this.controller,
    this.smsAutoFill = true,
    this.isDisabled = false,
    this.onTap,
    this.onChanged,
    this.label = 'OTP',
    this.labelPosition = "top",
    this.labelPrefix = const Icon(Icons.currency_bitcoin),
    this.labelSuffix,
  });

  @override
  State<PinInputCustom> createState() => _PinInputCustomState();
}

class _PinInputCustomState extends State<PinInputCustom> with CodeAutoFill {
  @override
  void initState() {
    super.initState();
    if (widget.smsAutoFill) {
      listenForCode();
    }
  }

  @override
  void dispose() {
    if (widget.smsAutoFill) {
      cancel();
    }
    super.dispose();
  }

  @override
  void codeUpdated() async {
    String? code = await SmsAutoFill().getAppSignature;

    if (widget.controller != null) {
      widget.controller?.text = code;
    }

    if (widget.onCompleted != null) {
      widget.onCompleted!(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration pinDecoration;

    switch (widget.type) {
      case 'filledCircle':
        pinDecoration = BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        );
        break;
      case 'outlinedCircle':
        pinDecoration = BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          shape: BoxShape.circle,
        );
        break;
      case 'filledSquare':
        pinDecoration = BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
        );
        break;
      case 'outlinedSquare':
        pinDecoration = BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
        );
        break;
      case 'underlined':
        pinDecoration = BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.blueAccent),
          ),
        );
        break;
      default:
        pinDecoration = BoxDecoration();
    }

    // Build the label widget
    Widget labelWidget = widget.label != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.labelPrefix != null) widget.labelPrefix!,
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Text(
                  widget.label!,
                ),
              ),
              if (widget.labelSuffix != null) widget.labelSuffix!,
            ],
          )
        : Container();

    // Deciding label position
    Widget contentWidget = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelPosition == "top") labelWidget,
        if (widget.labelPosition == "topCenter") 
          Align(
            alignment: Alignment.topCenter,
            child: labelWidget,
          ),
        Pinput(
          controller: widget.controller,
          length: widget.pinLength,
          validator: (s) {
            return null;
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: widget.showCursor,
          obscureText: widget.obscureText,
          enabled: !widget.isDisabled,
          defaultPinTheme: PinTheme(
            width: 56,
            height: 56,
            decoration: pinDecoration,
          ),
          onCompleted: widget.onCompleted,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
        ),
        if (widget.labelPosition == "bottom") labelWidget,
        if (widget.labelPosition == "bottomCenter") 
          Align(
            alignment: Alignment.bottomCenter,
            child: labelWidget,
          ),
      ],
    );

    if (widget.labelPosition == "left" || widget.labelPosition == "right") {
      contentWidget = Row(
        mainAxisAlignment: widget.labelPosition == "left"
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          if (widget.labelPosition == "left") labelWidget,
          Expanded(
            child: Pinput(
              controller: widget.controller,
              length: widget.pinLength,
              validator: (s) {
                return null;
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: widget.showCursor,
              obscureText: widget.obscureText,
              enabled: !widget.isDisabled,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                decoration: pinDecoration,
              ),
              onCompleted: widget.onCompleted,
              onTap: widget.onTap,
              onChanged: widget.onChanged,
            ),
          ),
          if (widget.labelPosition == "right") labelWidget,
        ],
      );
    }

    return contentWidget;
  }
}
