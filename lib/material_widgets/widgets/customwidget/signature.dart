import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/services.dart';

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

  static const platform = MethodChannel('samples.flutter.dev/mediaScanner');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _getSignatureData() async {
    var storagePermission = await Permission.storage.request();
    var managePermission = await Permission.manageExternalStorage.request();

    if (!storagePermission.isGranted || !managePermission.isGranted) {
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
    String downloadsPath =
        await ExternalPath.getExternalStoragePublicDirectory("Download");
    String filePath =
        '$downloadsPath/signature_${DateTime.now().millisecondsSinceEpoch}.png';

    final file = File(filePath);
    await file.writeAsBytes(data);
    print('✅ Signature saved to: $filePath');

    await scanFile(filePath);
  }

  Future<void> scanFile(String path) async {
    try {
      await platform.invokeMethod('scanFile', {'path': path});
    } on PlatformException catch (e) {
      print("Failed to scan file: '${e.message}'.");
    }
  }

  void _clearSignature() {
    _controller.clear();
  }

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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _getSignatureData,
                  icon: const Icon(Icons.check),
                  label: const Text('Get Signature'),
                ),
                ElevatedButton.icon(
                  onPressed: _clearSignature,
                  icon: const Icon(Icons.clear),
                  label: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
