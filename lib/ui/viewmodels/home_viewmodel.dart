import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/config.dart';
import 'package:wander_maps/data/models/destination.dart';
import 'package:wander_maps/data/util/validator.dart';
import 'package:wander_maps/ui/components/common/custom_toast.dart';
import 'package:wander_maps/ui/viewmodels/main_map_viewmodel.dart';
import 'package:wander_maps/ui/views/destination_index_screen.dart';
import 'package:wander_maps/ui/views/main_map_screen.dart';
import 'package:http/http.dart' as http;

class HomeViewModel with ChangeNotifier {
  String _searchText = "";
  late GooglePlace googlePlace;
  List<AutocompletePrediction> _predictions = [];
  String _mode = "KEYWORD";

  final TextEditingController _textEditingController = TextEditingController();

  String get mode => _mode;

  List<AutocompletePrediction> get predictions => _predictions;

  String get searchText => _searchText;

  TextEditingController get textEditingController => _textEditingController;

  void setText(String text) {
    _searchText = text;
  }

  void handleRadioButton(String mode) {
    _mode = mode;
    if (mode == "GPS") {
      String? errMsg = Validator.latLngValidator(_searchText);
      if (errMsg != null) {
        _textEditingController.clear();
        _predictions = [];
      }
    }
    notifyListeners();
  }

  void resetPredictions() {
    _predictions = [];
    notifyListeners();
  }

  Future<void> autoCompleteSearch(String value) async {
    googlePlace = GooglePlace(ApiKey.GOOGLE_MAP_API_KEY);
    final result = await googlePlace.autocomplete.get(value, language: "ja");

    if (result != null && result.predictions != null) {
      _predictions = result.predictions!;
      notifyListeners();
    }
  }

  void pushQuickSet(BuildContext context) async {
    final vm = context.read<MainMapViewModel>();
    Position p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng latLng = LatLng(p.latitude, p.longitude);
    Destination dest = Destination(
        id: -1,
        destinationName: "現在地",
        latitude: latLng.latitude,
        longitude: latLng.longitude,
        createDateTime: DateTime.now());
    vm.setDestination(dest);
    Navigator.push(context, MainMapScreen.route());
  }

  void pushGPSSearch(BuildContext context) {
    final vm = context.read<MainMapViewModel>();
    var errorMessage = Validator.latLngValidator(_searchText);
    if (errorMessage != null) {
      final fToast = FToast();
      fToast.init(context);
      fToast.showToast(
        child: CustomToast(
          msg: errorMessage,
          color: Colors.blue,
        ),
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }

    List<String> datas = searchText.split(",");
    double lat = double.parse(datas[0]);
    double lng = double.parse(datas[1]);

    LatLng latLng = LatLng(lat, lng);
    Destination dest = Destination(
        id: -1,
        destinationName: '${lat.toString()}, ${lng.toString()}',
        latitude: latLng.latitude,
        longitude: latLng.longitude,
        createDateTime: DateTime.now());
    vm.setDestination(dest);
    Navigator.push(context, MainMapScreen.route());
  }

  void pushIndex(BuildContext context) {
    Navigator.push(context, DestinationIndexScreen.route());
  }

  void pushPrediction(BuildContext context, int index) async {
    final vm = context.read<MainMapViewModel>();
    String URL =
        "https://maps.googleapis.com/maps/api/place/details/json?language=ja&place_id=";

    String APIKEY = '&key=${ApiKey.GOOGLE_MAP_API_KEY}';

    String requestUrl = URL + _predictions[index].placeId.toString() + APIKEY;
    http.Response? response;
    response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      final responseBody = response.body;
      final res = jsonDecode(responseBody);
      var location = res['result']['geometry']['location'];
      double lat = double.parse(location['lat'].toString());
      double lng = double.parse(location['lng'].toString());
      String name = res['result']['name'];

      Destination destination = Destination(
          id: -1,
          destinationName: name,
          latitude: lat,
          longitude: lng,
          createDateTime: DateTime.now());
      vm.setDestination(destination);
      Navigator.push(context, MainMapScreen.route());
    }
  }
}
