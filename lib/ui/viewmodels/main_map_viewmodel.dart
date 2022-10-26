import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/data/consts/enum.dart';
import 'package:wander_maps/data/models/destination.dart';
import 'package:wander_maps/data/consts/locations.dart';
import 'package:wander_maps/data/repositories/destination_repository.dart';
import 'package:wander_maps/ui/components/common/custom_toast.dart';
import 'package:wander_maps/ui/viewmodels/compass_viewmodel.dart';
import 'package:wander_maps/ui/views/compass_screen.dart';

class MainMapViewModel with ChangeNotifier {
  MainMapViewModel({repository}) : _repository = repository;

  final DestinationRepository _repository;

  late Destination _destination;

  late GoogleMapController _mapController;

  final _textEditingController = TextEditingController();

  TextEditingController get textEditingController => _textEditingController;

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
    _textEditingController.text = (_destination.destinationName == "")
        ? '${_destination.latitude.toString()}, ${_destination.longitude.toString()}'
        : _destination.destinationName;
  }

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  void addMakers(LatLng latLng) {
    Marker marker = Marker(
        markerId: MarkerId(MarkerIdEnum.targetMaker.toString()),
        position: latLng,
        onTap: () {
          Clipboard.setData(ClipboardData(
              text:
                  '${latLng.latitude.toString()}, ${latLng.longitude.toString()}'));
//          final fToast = FToast();
//      fToast.init(context);
//           fToast.showToast(
//             child: const CustomToast(
//               msg: "マーカーの座標をコピーしました。",
//               color: Colors.blueAccent,
//             ),
//             gravity: ToastGravity.BOTTOM,
//           );
        });

    _markers.add(marker);
    _destination.latitude = latLng.latitude;
    _destination.longitude = latLng.longitude;
    _textEditingController.text = (_destination.destinationName == "")
        ? '${_destination.latitude.toString()}, ${_destination.longitude.toString()}'
        : _destination.destinationName;

    notifyListeners();
  }

  void tapMap(LatLng latLng) {
    _markers = {};
    addMakers(latLng);
  }

  void pushCompass(BuildContext context) {
    final vm = context.read<CompassViewModel>();
    final name = _destination.id > 0
        ? _destination.destinationName
        : _markers.first.position.latitude.toStringAsFixed(5) +
            "," +
            _markers.first.position.longitude.toStringAsFixed(5);
    final Destination dest = Destination(
        id: _destination.id,
        destinationName: name,
        latitude: _markers.first.position.latitude,
        longitude: _markers.first.position.longitude,
        createDateTime: vm.destination.createDateTime);

    vm.setDestination(dest);
    Navigator.push(context, CompassScreen.route());
  }

  void addDestination() {
    _destination.destinationName = _textEditingController.text;
    _repository.addDestination(_destination);
  }
}
