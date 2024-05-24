import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

class PlaceModel with ClusterItem {
  int? id;
  int? type;
  String? name;
  final LatLng latLng;

  PlaceModel({required this.name, required this.latLng,  this.type, required this.id});

  @override
  LatLng get location => latLng;
}
