// import 'dart:async';
// import 'dart:ui';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:sport_app/core/router/routes.dart';
// import 'package:sport_app/data/models/facility/facility_data.dart';
//
// class PlaceModel with ClusterItem {
//   int? id;
//   int? type;
//   String? name;
//   final LatLng latLng;
//
//   PlaceModel({required this.name, required this.latLng, required this.type, required this.id});
//
//   @override
//   LatLng get location => latLng;
// }
//
// class FacilitiesMapPage extends StatefulWidget {
//   final List<FacilityData> facilities;
//   const FacilitiesMapPage({super.key, required this.facilities});
//
//   @override
//   State<FacilitiesMapPage> createState() => _FacilitiesMapPage();
// }
//
// class _FacilitiesMapPage extends State<FacilitiesMapPage> {
//   Set<Marker> markers = {};
//   late Completer<GoogleMapController> googleMapController = Completer<GoogleMapController>();
//   late ClusterManager clusterManager;
//   CameraPosition? _lastCameraPosition;
//
//   List<PlaceModel> placeList = [
//     PlaceModel(id: 1, type: 1, name: "Example Place1", latLng: const LatLng(38.417392, 27.163635)),
//     PlaceModel(id: 2, type: 0, name: "Example Place2", latLng: const LatLng(38.429227, 27.203803)),
//     PlaceModel(id: 3, type: 1, name: "Example Place3", latLng: const LatLng(38.444287, 27.187667)),
//     PlaceModel(id: 4, type: 0, name: "Галактика", latLng: const LatLng(38.468483, 27.174278)),
//     PlaceModel(id: 5, type: 1, name: "Example Place5", latLng: const LatLng(38.447245, 27.250152)),
//     PlaceModel(id: 6, type: 0, name: "Example Place6", latLng: const LatLng(38.477622, 27.212043)),
//     PlaceModel(id: 7, type: 1, name: "Example Place7", latLng: const LatLng(38.446976, 27.230239)),
//     PlaceModel(id: 8, type: 0, name: "Example Place8", latLng: const LatLng(38.482191, 27.213416)),
//     PlaceModel(id: 9, type: 1, name: "Example Place9", latLng: const LatLng(38.449127, 27.201400)),
//     PlaceModel(id: 10, type: 1, name: "Example Place10", latLng: const LatLng(38.467946, 27.215476)),
//   ];
//
//   @override
//   void initState() {
//     clusterManager = _initClusterManager();
//     super.initState();
//   }
//
//   ClusterManager _initClusterManager() {
//     return ClusterManager<PlaceModel>(placeList, _updateMarkers, markerBuilder: markerBuilder);
//   }
//
//   void _updateMarkers(Set<Marker> markers) {
//     setState(() {
//       this.markers = markers;
//     });
//   }
//
//   Future<Marker> Function(Cluster<PlaceModel>) get markerBuilder => (cluster) async {
//         int typeZeroCount = cluster.items.where((element) => element.type == 0).length;
//         int typeOneCount = cluster.items.where((element) => element.type == 1).length;
//
//         if (cluster.isMultiple) {
//           return Marker(
//             markerId: MarkerId(cluster.getId()),
//             position: cluster.location,
//             icon: await getMarkerBitmap(150, 150, typeZeroCount, typeOneCount, text: cluster.count.toString()),
//             onTap: () async {
//               if (_lastCameraPosition != null) {
//                 final zoom = _lastCameraPosition!.zoom + 1;
//                 final GoogleMapController controller = await googleMapController.future;
//                 controller.animateCamera(CameraUpdate.newLatLngZoom(cluster.location, zoom));
//               }
//             },
//           );
//         } else {
//           return Marker(
//             markerId: MarkerId(cluster.items.single.id.toString()),
//             position: cluster.location,
//             infoWindow: InfoWindow(
//               title: cluster.items.single.name,
//               onTap: () => context.push(AppRoutes.facilityDetails, extra: widget.facilities[4]),
//             ),
//           );
//         }
//       };
//
//   Future<BitmapDescriptor> getMarkerBitmap(int size, double size2, int typeZeroLength, int typeOneLength,
//       {String? text}) async {
//     if (kIsWeb) size = (size / 2).floor();
//
//     final PictureRecorder pictureRecorder = PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);
//     final Paint paint3 = Paint()..color = Colors.orange;
//     final Paint paint2 = Paint()..color = Colors.white;
//
//     double degreesToRads(num deg) {
//       return (deg * 3.14) / 180.0;
//     }
//
//     int total = typeZeroLength + typeOneLength;
//     var totalRatio = 2.09439666667 * 3;
//     double percentageOfLength = (typeZeroLength / total);
//     var resultRatio = totalRatio * percentageOfLength;
//
//     canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint3);
//     canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint3);
//     canvas.drawCircle(Offset(size / 2, size / 2), size / 3.8, paint3);
//     canvas.drawArc(const Offset(0, 0) & Size(size2, size2), degreesToRads(90.0), resultRatio, true, paint3);
//     canvas.drawCircle(Offset(size / 2, size / 2), size / 3.2, paint2);
//     if (text != null) {
//       TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
//       painter.text = TextSpan(
//         text: text,
//         style: TextStyle(fontSize: size / 3, color: Colors.black, fontWeight: FontWeight.normal),
//       );
//       painter.layout();
//       painter.paint(
//         canvas,
//         Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
//       );
//     }
//     final img = await pictureRecorder.endRecording().toImage(size, size);
//     final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;
//     return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         initialCameraPosition: const CameraPosition(
//           target: LatLng(38.445094, 27.214790),
//           zoom: 10,
//         ),
//         markers: markers,
//         onMapCreated: (GoogleMapController controller) async {
//           googleMapController.complete(controller);
//           clusterManager.setMapId(controller.mapId);
//         },
//         onCameraMove: (position) {
//           clusterManager.onCameraMove(position);
//         },
//         onCameraIdle: clusterManager.updateMap,
//       ),
//     );
//   }
// }
