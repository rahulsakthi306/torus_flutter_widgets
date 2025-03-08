import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/fab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Floatab(),
          
          // child: MyForm(),
        ),
        // floatingActionButton: Floatab(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  // This function will be triggered when the user finishes editing
  void _onEditingComplete() {
    // This gets called when the user finishes editing in the TextFormField
    if (_formKey.currentState?.validate() ?? false) {
      // You can add any action you want here, like submitting the form
      print('Form is valid, value entered: ${_controller.text}');
      // Clear the input field after submission
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Enter some text'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null; 
            },
            onEditingComplete: _onEditingComplete,
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _controller2,
            decoration: InputDecoration(labelText: 'Enter some text'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null; 
            },
            onEditingComplete: _onEditingComplete,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
