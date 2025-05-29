import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinInput extends StatefulWidget {
  const PinInput({super.key});

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _currentPin = "";

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _onPinChanged(String value) {
    setState(() => _currentPin = value);
  }

  void _onPinCompleted(String value) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PIN Entered: $value")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Enter your 6-digit PIN",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                _buildPinField(),
                const SizedBox(height: 24),
                Text(
                  "Current PIN: $_currentPin",
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget _buildPinField() {
  return PinCodeTextField(
    appContext: context,
    controller: _pinController,
    length: 6,
    obscureText: true,
    obscuringWidget: Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    ), 
    keyboardType: TextInputType.number,
    animationType: AnimationType.fade,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.circle, 
      fieldHeight: 50,
      fieldWidth: 50,
      activeColor: Colors.blue,
      inactiveColor: Colors.grey[400]!,
      selectedColor: Colors.blueAccent,
      activeFillColor: Colors.white,
      inactiveFillColor: Colors.grey[200]!,
      selectedFillColor: Colors.white,
      borderRadius: BorderRadius.circular(0), 
    ),
    animationDuration: const Duration(milliseconds: 250),
    enableActiveFill: true,
    onChanged: _onPinChanged,
    onCompleted: _onPinCompleted,
    validator: (value) {
      if (value == null || value.length < 6) {
        return 'Enter complete 6-digit PIN';
      }
      return null;
    },
    beforeTextPaste: (text) => false,
  );
}

}
