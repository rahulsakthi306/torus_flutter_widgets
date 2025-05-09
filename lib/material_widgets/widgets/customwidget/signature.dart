import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _controller = SignatureController(
    penColor: Colors.black, 
    penStrokeWidth: 5, 
    exportBackgroundColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Signature(
              controller: _controller,
              height: 300,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}