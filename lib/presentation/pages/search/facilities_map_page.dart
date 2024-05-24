import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/utils/data_parser.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/data/models/facility/facility_place_model.dart';

class FacilitiesMapPage extends StatefulWidget {
  final List<FacilityData> facilities;

  const FacilitiesMapPage({super.key, required this.facilities});

  @override
  State<FacilitiesMapPage> createState() => _FacilitiesMapPage();
}

class _FacilitiesMapPage extends State<FacilitiesMapPage> {
  Set<Marker> markers = {};
  CameraPosition? _lastCameraPosition;
  late Completer<GoogleMapController> googleMapController;
  late ClusterManager clusterManager;
  late List<PlaceModel> placeList;

  @override
  void initState() {
    googleMapController = Completer<GoogleMapController>();
    placeList = widget.facilities.map((facility) {
      List<String> locationParts = facility.location?.split(',') ?? [];
      return PlaceModel(
        id: facility.id,
        name: facility.name,
        latLng: LatLng(
          double.parse(locationParts[0]),
          double.parse(locationParts[1]),
        ),
      );
    }).toList();
    clusterManager = _initClusterManager();

    super.initState();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<PlaceModel>(placeList, _updateMarkers, markerBuilder: markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    setState(() {
      this.markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(48.516880, 35.038001),
          zoom: 10,
        ),
        markers: markers,
        onMapCreated: (GoogleMapController controller) async {
          googleMapController.complete(controller);
          clusterManager.setMapId(controller.mapId);
        },
        onCameraMove: (position) {
          clusterManager.onCameraMove(position);
        },
        onCameraIdle: clusterManager.updateMap,
      ),
    );
  }

  Future<Marker> Function(Cluster<PlaceModel>) get markerBuilder => (cluster) async {
        if (cluster.isMultiple) {
          return Marker(
            markerId: MarkerId(cluster.getId()),
            position: cluster.location,
            icon: await DateParser.getMarkerBitmap(
                150,
                150,
                text: cluster.count.toString(),
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.background),
            onTap: () async {
              if (_lastCameraPosition != null) {
                final zoom = _lastCameraPosition!.zoom + 1;
                final GoogleMapController controller = await googleMapController.future;
                controller.animateCamera(CameraUpdate.newLatLngZoom(cluster.location, zoom));
              }
            },
          );
        } else {
          return Marker(
            markerId: MarkerId(cluster.items.single.id.toString()),
            position: cluster.location,
            infoWindow: InfoWindow(
              title: cluster.items.single.name,
              onTap: () => context.push(AppRoutes.facilityDetails, extra: widget.facilities[4]),
            ),
          );
        }
      };
}
