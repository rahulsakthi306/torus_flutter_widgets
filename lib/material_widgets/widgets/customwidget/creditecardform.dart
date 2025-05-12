import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({super.key});

  @override
  State<CreditCardForm> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expDateController = TextEditingController();
  final _cvvController = TextEditingController();

  bool _obscureCard = true;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _toggleCardVisibility() {
    setState(() {
      _obscureCard = !_obscureCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildCardNumberField(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildExpiryDateField()),
              const SizedBox(width: 16),
              Expanded(child: _buildCVVField()),
            ],
          ),
          const SizedBox(height: 24),
          // ElevatedButton(
          //   onPressed: () {
          //     if (_formKey.currentState!.validate()) {
          //       debugPrint('Card: ${_cardNumberController.text}');
          //       debugPrint('Expiry: ${_expDateController.text}');
          //       debugPrint('CVV: ${_cvvController.text}');
          //     }
          //   },
          //   child: const Text('Submit'),
          // ),
        ],
      ),
    );
  }

  Widget _buildCardNumberField() {
    return TextFormField(
      controller: _cardNumberController,
      keyboardType: TextInputType.number,
      // obscureText: _obscureCard,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        CardNumberInputFormatter(),
      ],
      decoration: InputDecoration(
        labelText: 'Card Number',
        hintText: 'XXXX XXXX XXXX XXXX',
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        String cleaned = value?.replaceAll(' ', '') ?? '';
        if (cleaned.length != 16) {
          return 'Enter a valid 16-digit card number';
        }
        return null;
      },
    );
  }

  Widget _buildExpiryDateField() {
    return TextFormField(
      controller: _expDateController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
        ExpDateFormatter(),
      ],
      decoration: const InputDecoration(
        labelText: 'Expiry Date',
        hintText: 'MM/YY',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || !RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(value)) {
          return 'Enter a valid expiry date';
        }
        return null;
      },
    );
  }

  Widget _buildCVVField() {
    return TextFormField(
      controller: _cvvController,
      keyboardType: TextInputType.number,
      // obscureText: _obscureCard,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
      ],
      decoration: InputDecoration(
        labelText: 'CVV',
        hintText: 'XXX',
        border: const OutlineInputBorder(),
        // suffixIcon: IconButton(
        //   icon: Icon(_obscureCard ? Icons.visibility : Icons.visibility_off),
        //   onPressed: _toggleCardVisibility,
        // ),
      ),
      validator: (value) {
        if (value == null || value.length < 3 || value.length > 4) {
          return 'CVV must be 3 or 4 digits';
        }
        return null;
      },
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(digits[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class ExpDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    String newText = '';

    if (digits.length >= 2) {
      newText = digits.substring(0, 2);
      if (digits.length > 2) {
        newText += '/${digits.substring(2, digits.length.clamp(2, 4))}';
      }
    } else {
      newText = digits;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
