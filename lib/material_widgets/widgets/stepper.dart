import 'package:flutter/material.dart';

List<String> type = ["horizontal", "vertical"];

class TorusStepper extends StatefulWidget {
  final String? type;
  const TorusStepper({super.key, this.type = "horizontal"});

  @override
  State<TorusStepper> createState() => TorusStepperState();
}

class TorusStepperState extends State<TorusStepper> {
  int _currentStep = 0;

  late final Map<String, Step> steps = {
    'component': Step(
      title: Text('Consent'),
      content: Text('Do something in step 1'),
      isActive: _currentStep >= 0,
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
    ),
    'components': Step(
      title: Text('Authorize'),
      content: Text('Do something in step 2'),
      isActive: _currentStep >= 1,
      state: _currentStep > 1 ? StepState.complete : StepState.indexed,
    ),
    'moreComponents': Step(
      title: Text('Complete'),
      content: Text('Do something in step 3'),
      isActive: _currentStep >= 2,
      state: _currentStep == 2 ? StepState.editing : StepState.indexed,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Stepper Example')),
      body: Stepper(
        currentStep: _currentStep,
        type: widget.type == "horizontal"
            ? StepperType.horizontal
            : StepperType.vertical,
        onStepContinue: () {
          if (_currentStep < steps.length - 1) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        onStepTapped: (int step) {
          setState(() {
            _currentStep = step;
          });
        },
        steps: steps.values.toList(),
      ),
    );
  }
}
