import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';

class TestScreen2Tfpinnumber6a5f extends StatefulWidget {
  final int pinLength;
  final String type;
  final String? hintText;
  final bool isDisabled;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final bool showCursor;
  final bool isPassword;
  final String? helperText;
  final Widget? prefix;
  final Widget? suffix;
  final String? label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const TestScreen2Tfpinnumber6a5f({
    super.key,
    this.type = 'filled-square',
    this.hintText,
    this.isDisabled = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.showCursor = true,
    this.isPassword = false,
    this.helperText,
    this.prefix,
    this.suffix,
    this.pinLength = 4,
    this.label = '',
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  State<TestScreen2Tfpinnumber6a5f> createState() =>
      _TestScreen2Tfpinnumber6a5fState();
}

class _TestScreen2Tfpinnumber6a5fState extends State<TestScreen2Tfpinnumber6a5f>
    with CodeAutoFill {
  late List<TextEditingController> _controllers;
  late FocusNode _focusNode;
  late SmsAutoFill _smsAutoFill;
  late List<FocusNode> _focusNodes;
  String _pin = '';

  Timer? _timer;
  int _start = 30;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.pinLength, (_) => TextEditingController());
    _focusNode = FocusNode();
    _focusNodes = List.generate(widget.pinLength, (_) => FocusNode());
    _smsAutoFill = SmsAutoFill();
    _listenForCode();
    _startTimer();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _start = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _listenForCode() async {
    _smsAutoFill.listenForCode;
  }

  // Code update callback
  @override
  void codeUpdated() {
    if (code != null && code!.length == widget.pinLength) {
     
    }
  }

  // Handle pin change and focus movement
  void _onPinChanged(String value, int index) {
    if (value.isNotEmpty && index < widget.pinLength - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    // Update the pin value
    _pin = _controllers.map((controller) => controller.text).join();
    if (widget.onChanged != null) {
      widget.onChanged!(_pin);
    }
  }

  // Builds the input fields for the pin code
  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(8);

    InputDecoration inputDecoration = _buildInputDecoration(borderRadius);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.pinLength, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Flexible(
                flex: 1,
                child: TextFormField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  decoration: inputDecoration.copyWith(
                    counterText: '',
                    hintText: widget.hintText ?? '•',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 1,
                  keyboardType: widget.keyboardType ?? TextInputType.number,
                  textAlign: TextAlign.center,
                  textAlignVertical: widget.textAlignVertical,
                  showCursor: widget.showCursor,
                  obscureText: widget.isPassword,
                  enabled: !widget.isDisabled,
                  onChanged: (value) {
                    _onPinChanged(value, index);
                  },
                  validator: widget.validator,
                  autofillHints: [AutofillHints.oneTimeCode],
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 8.0),
        Text(widget.helperText ?? '')
      ],
    );
  }

  InputDecoration _buildInputDecoration(BorderRadius borderRadius) {
    var decoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    );

    switch (widget.type) {
     case 'filled-circle':
        return decoration.copyWith(
          filled: true,
          fillColor: widget.type == 'filled-circle'
              ? Colors.grey.shade200
              : Theme.of(context).primaryColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(100),
          ),
        );
      case 'outlined-circle':
        return decoration.copyWith(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
        );
      case 'filled-square':
        return decoration.copyWith(
          filled: true,
          fillColor: widget.type == 'filled-square' ? Colors.grey.shade200 : Theme.of(context).primaryColor,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.zero,
          ),
        );
      case 'outlined-square':
        return decoration.copyWith(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.zero,
          ),
        );
      case 'underlined':
        return decoration.copyWith(
          filled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
        );
      default:
        return decoration.copyWith(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: borderRadius,
          ),
        );
    }
  }
}
