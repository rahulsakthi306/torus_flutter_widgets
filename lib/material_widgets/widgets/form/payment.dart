import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  String? errorText;

  void _validateInput(String value) {
    final number =
        double.tryParse(value.replaceAll(',', '').replaceAll('\$', ''));
    if (number != null && number > 500000) {
      setState(() {
        errorText = 'Amount must be \$500,000 or less';
      });
    } else {
      setState(() {
        errorText = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Send Money',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage:
                  NetworkImage('https://avatar.iran.liara.run/public/boy'),
            ),
            const SizedBox(height: 10),
            const Text(
              'John Doe',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Text(
              'Bank of America',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: TextField(
                  decoration: InputDecoration(
                  prefixText: '\$',
                  prefixStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorText: errorText,
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                onChanged: _validateInput,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 145),
              child: TextField(
                controller: purposeController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  hintText: 'Add purpose',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue.shade700,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}