import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wander_maps/data/models/destination.dart';

class CompassViewModel with ChangeNotifier {
  late StreamSubscription<Position> positionStream;
  Position? currentPosition;
  double _arrowAngle = 0.0;
  double _wArrowAngle = 0.0;
  double _compassAngle = 0.0;
  double _distance = 0.0;

  late Destination _destination = Destination(
      id: -1,
      destinationName: "",
      latitude: 0,
      longitude: 0,
      createDateTime: DateTime.now());

  Destination get destination => _destination;

  void setDestination(Destination destination) {
    _destination = destination;
  }

  double get arrowAngle => _arrowAngle;

  double get compassAngle => _compassAngle;

  double get distance => _distance;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high, //正確性
    distanceFilter: 0,
  );

  gpsListener() {
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      currentPosition = position;
      print(
          '${currentPosition?.latitude.toString()}, ${currentPosition!.longitude.toString()}');

      _distance = Geolocator.distanceBetween(
          currentPosition!.latitude,
          currentPosition!.longitude,
          _destination.latitude,
          _destination.longitude);
      _wArrowAngle = Geolocator.bearingBetween(
          currentPosition!.latitude,
          currentPosition!.longitude,
          _destination.latitude,
          _destination.longitude);
      _arrowAngle = _compassAngle - ((pi / 180) * _wArrowAngle * -1);

      notifyListeners();
    });
  }

  compassListener() {
    FlutterCompass.events?.listen((value) {
      if (value.heading != null) {
        _compassAngle = -1 * pi * ((value.heading!) / 180);
      }
      _arrowAngle = _compassAngle - ((pi / 180) * _wArrowAngle * -1);

      notifyListeners();
    });
  }

  void stopListener() {
    positionStream.cancel();
  }
}
