// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRViewExample extends StatefulWidget {
//   const QRViewExample({super.key});

//   @override
//   State<StatefulWidget> createState() => _QRViewExampleState();
// }

// class _QRViewExampleState extends State<QRViewExample> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller?.pauseCamera();
//     }
//     controller?.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(flex: 4, child: _buildQrView(context)),
//             Expanded(
//               flex: 1,
//               child: FittedBox(
//                 fit: BoxFit.contain,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     if (result != null)
//                       Text(
//                         'Type: ${describeEnum(result!.format)}\nData: ${result!.code}',
//                         textAlign: TextAlign.center,
//                       )
//                     else
//                       const Text('Scan a code'),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         _buildControlButton(
//                           label: 'Flash',
//                           onPressed: () async {
//                             await controller?.toggleFlash();
//                             setState(() {});
//                           },
//                           future: controller?.getFlashStatus(),
//                           formatter: (data) => 'Flash: $data',
//                         ),
//                         _buildControlButton(
//                           label: 'Camera',
//                           onPressed: () async {
//                             await controller?.flipCamera();
//                             setState(() {});
//                           },
//                           future: controller?.getCameraInfo(),
//                           formatter: (data) =>
//                               'Camera: ${describeEnum(data!)}',
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         _basicButton('Pause', () => controller?.pauseCamera()),
//                         _basicButton('Resume', () => controller?.resumeCamera()),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildControlButton<T>({
//     required String label,
//     required VoidCallback onPressed,
//     required Future<T>? future,
//     required String Function(T?) formatter,
//   }) {
//     return Container(
//       margin: const EdgeInsets.all(8),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         child: FutureBuilder<T>(
//           future: future,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done &&
//                 snapshot.hasData) {
//               return Text(formatter(snapshot.data));
//             } else {
//               return Text('$label: ...');
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget _basicButton(String text, VoidCallback onPressed) {
//     return Container(
//       margin: const EdgeInsets.all(8),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         child: Text(text, style: const TextStyle(fontSize: 20)),
//       ),
//     );
//   }

//   Widget _buildQrView(BuildContext context) {
//     var scanArea = MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400
//         ? 150.0
//         : 300.0;

//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//         borderColor: Colors.red,
//         borderRadius: 10,
//         borderLength: 30,
//         borderWidth: 10,
//         cutOutSize: scanArea,
//       ),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }

//   void _onPermissionSet(
//       BuildContext context, QRViewController ctrl, bool hasPermission) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $hasPermission');
//     if (!hasPermission) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('No camera permission')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
