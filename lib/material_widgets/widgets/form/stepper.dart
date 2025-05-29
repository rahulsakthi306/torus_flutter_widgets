import 'package:flutter/material.dart';

class Stepperform extends StatefulWidget {
  const Stepperform({super.key});

  @override
  State<Stepperform> createState() => _StepperformState();
}

class _StepperformState extends State<Stepperform> {
  int _currentStep = 0;

  final _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _authCodeController = TextEditingController();
  
  bool _showSecondForm = false;

  List<Step> stepList() => [
    Step(
      title: const Text(''),
      content: Form(
        key: _formKeys[0],
        child: Column(
          children: [
            if (!_showSecondForm) ...[
              TextFormField(
                controller: _accountController,
                decoration: const InputDecoration(labelText: 'Enter account name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter account name' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKeys[0].currentState!.validate()) {
                    setState(() {
                      _showSecondForm = true; // Show second form
                    });
                  }
                },
                child: const Text('Next'),
              ),
            ],
            if (_showSecondForm) ...[
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Enter address'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter address' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKeys[0].currentState!.validate()) {
                    setState(() {
                      _currentStep += 1; // Move to next step
                    });
                  }
                },
                child: const Text('Continue to Step 2'),
              ),
            ],
          ],
        ),
      ),
    ),
    Step(
      title: const Text(''),
      content: Form(
        key: _formKeys[1],
        child: TextFormField(
          controller: _authCodeController,
          decoration: const InputDecoration(labelText: 'Enter authentication code'),
          validator: (value) =>
              value == null || value.isEmpty ? 'Please enter authentication code' : null,
        ),
      ),
    ),
    Step(
      title: const Text(''),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Account: ${_accountController.text}"),
          Text("Address: ${_addressController.text}"),
          Text("Auth Code: ${_authCodeController.text}"),
          const SizedBox(height: 10),
          const Text("Please confirm your details."),
        ],
      ),
    ),
  ];

  void _onStepContinue() {
    if (_currentStep < 2) {
      if (_currentStep < _formKeys.length &&
          !_formKeys[_currentStep].currentState!.validate()) {
        return;
      }
      setState(() {
        _currentStep += 1;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form Submitted")),
      );
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
        if (_currentStep == 0) {
          _showSecondForm = false; // Reset the form toggle when going back
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: _onStepContinue,
        onStepCancel: _onStepCancel,
        steps: stepList(),
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text(
                    _currentStep == stepList().length - 1 ? 'Submit' : 'Next'),
              ),
              const SizedBox(width: 8),
              if (_currentStep > 0)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text('Back'),
                ),
            ],
          );
        },
      ),
    );
  }
}