import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:external_path/external_path.dart';

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _getSignatureData() async {
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      print('Storage permission denied');
      return;
    }
    if (_controller.isNotEmpty) {
      Uint8List? signature = await _controller.toPngBytes();
      if (signature != null) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/signature.png');
        await file.writeAsBytes(signature);
        await saveToDownloads(signature);
      } else {
        debugPrint('Failed to capture signature.');
      }
    } else {
      debugPrint('Signature is empty.');
    }
  }

  Future<void> saveToDownloads(Uint8List data) async {
    String downloadsPath = await ExternalPath.getExternalStoragePublicDirectory(
      "Download",
    );

    // Create a file in the Downloads folder
    final file = File(
        '$downloadsPath/signature_${DateTime.now().millisecondsSinceEpoch}.png');

    // Write the image data
    await file.writeAsBytes(data);
    print('✅ Signature saved to: ${file.path}');
  }

  void _clearSignature() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signature'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: _clearSignature,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Signature(
              controller: _controller,
              height: 300,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _getSignatureData,
              icon: const Icon(Icons.check),
              label: const Text('Get Signature'),
            ),
          ],
        ),
      ),
    );
  }
}
