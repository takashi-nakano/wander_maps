import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/data/consts/enum.dart';
import 'package:wander_maps/data/models/destination.dart';
import 'package:wander_maps/data/consts/locatioms.dart';
import 'package:wander_maps/ui/components/common/custom_toast.dart';
import 'package:wander_maps/ui/viewmodels/compass_viewmodel.dart';
import 'package:wander_maps/ui/views/compass_screen.dart';

class MainMapViewModel with ChangeNotifier {
  late Destination _destination;

  late GoogleMapController _mapController;

  Set<Marker> _markers = {};

  Set<Marker> get markers => _markers;

  Destination get destination => _destination;

  GoogleMapController get mapController => _mapController;

  late CameraPosition _cameraPosition;

  CameraPosition get cameraPosition => _cameraPosition;

  void setDestination(Destination dest) {
    _destination = dest;
    _markers = {};
    addMakers(LatLng(dest.latitude, dest.longitude));
    _cameraPosition = CameraPosition(
        zoom: Location.detailZoomLevel,
        target: LatLng(dest.latitude, dest.longitude));
  }

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  void addMakers(LatLng latLng) {
    Marker marker = Marker(
      markerId: MarkerId(MarkerIdEnum.targetMaker.toString()),
      position: latLng,
      onTap: () { Clipboard.setData(ClipboardData(
          text:
              '${latLng.latitude.toString()}, ${latLng.longitude.toString()}'));
      final fToast = FToast();
//      fToast.init(context);
      fToast.showToast(
        child: const CustomToast(
          msg: "マーカーの座標をコピーしました。",
          color: Colors.blueAccent,
        ),
        gravity: ToastGravity.BOTTOM,
      );
      }
    );


    _markers.add(marker);
    notifyListeners();
  }

  void tapMap(LatLng latLng) {
    _markers = {};
    addMakers(latLng);
  }

  void pushCompass(BuildContext context) {
    final vm = context.read<CompassViewModel>();
    final Destination dest = Destination(
        destinationName: _markers.first.position.latitude.toStringAsFixed(5) +
            "," +
            _markers.first.position.longitude.toStringAsFixed(5),
        latitude: _markers.first.position.latitude,
        longitude: _markers.first.position.longitude,
        createDateTime: DateTime.now());

    vm.setDestination(dest);
    Navigator.push(context, CompassScreen.route());
  }
}
