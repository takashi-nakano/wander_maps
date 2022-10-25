import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  // 初期値は東京都庁
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(35.6882296, 139.6936655), zoom: 7.0);

  static Position initialPosition = Position(
      longitude: 35.6882296,
      latitude: 139.6936655,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0);

  static const double detailZoomLevel = 15.0;
}
