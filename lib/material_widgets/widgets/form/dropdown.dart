import 'package:flutter/material.dart';

class Bank {
  final String name;
  final IconData icon;

  Bank({required this.name, required this.icon});
}

class BankDropdownExample extends StatefulWidget {
  const BankDropdownExample({super.key});

  @override
  _BankDropdownExampleState createState() => _BankDropdownExampleState();
}

class _BankDropdownExampleState extends State<BankDropdownExample> {
  final List<Bank> _banks = [
    Bank(name: "Bank of America", icon: Icons.account_balance),
    Bank(name: "Chase", icon: Icons.account_balance_wallet),
    Bank(name: "Wells Fargo", icon: Icons.account_box),
  ];

  Bank? _selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Your Bank")),
      body: Center(
        child: DropdownButton<Bank>(
          hint: Text("Choose a bank"),
          value: _selectedBank,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          items: _banks.map((bank) {
            return DropdownMenuItem<Bank>(
              value: bank,
              child: Row(
                children: [
                  Icon(bank.icon),
                  SizedBox(width: 10),
                  Text(bank.name),
                  Spacer(),
                  if (_selectedBank == bank)
                    Icon(Icons.check, color: Colors.green),
                ],
              ),
            );
          }).toList(),
          onChanged: (Bank? newBank) {
            setState(() {
              _selectedBank = newBank;
            });
          },
        ),
      ),
    );
  }
}
