// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

// class SimpleMapPage extends StatefulWidget {
//   const SimpleMapPage({super.key});

//   @override
//   State<SimpleMapPage> createState() => _SimpleMapPageState();
// }

// class _SimpleMapPageState extends State<SimpleMapPage> {
//   late final MapController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = MapController(
//       initPosition: GeoPoint(
//         latitude: 47.4358055,
//         longitude: 8.4737324,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   Future<void> _addHomeMarker() async {
//     await controller.addMarker(
//       GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
//       markerIcon: const MarkerIcon(
//         iconWidget: Icon(Icons.home, color: Colors.red, size: 48),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: OSMFlutter(
//   controller: controller,
//   onMapIsReady: (isReady) async {
//     if (isReady) {
//       await _addHomeMarker();
//     }
//   },
//   osmOption: OSMOption(
//     zoomOption: const ZoomOption(
//       initZoom: 12,
//       minZoomLevel: 8,
//       maxZoomLevel: 16,
//       stepZoom: 1.0,
//     ),
//     userTrackingOption: const UserTrackingOption(
//       enableTracking: false,
//       unFollowUser: false,
//     ),
//     roadConfiguration: const RoadOption(
//       roadColor: Colors.blueAccent,
//     ),
//   ),
// ),

//     );
//   }
// }


