import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrViewer extends StatefulWidget {
  final String? data;

  const QrViewer({super.key, this.data = 'rahul'});

  @override
  State<QrViewer> createState() => _QrViewerState();
}

class _QrViewerState extends State<QrViewer> {
  String? _lastData;

  @override
  void didUpdateWidget(covariant QrViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      setState(() {
        _lastData = widget.data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _lastData = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    if (_lastData == null || _lastData!.isEmpty) {
      return const Center(
        child: Text(
          'No QR data provided',
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      );
    }

    return Center(
      child: QrImageView(
        data: _lastData!,
        version: QrVersions.auto,
        size: 300.0,
        backgroundColor: Colors.white,
        gapless: true,
        errorStateBuilder: (cxt, err) {
          return const Center(
            child: Text(
              'Error generating QR code',
              style: TextStyle(color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
