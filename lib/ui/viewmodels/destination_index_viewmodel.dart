import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/data/models/destination.dart';
import 'package:wander_maps/ui/viewmodels/compass_viewmodel.dart';
import 'package:wander_maps/ui/viewmodels/main_map_viewmodel.dart';
import 'package:wander_maps/ui/views/compass_screen.dart';
import 'package:wander_maps/ui/views/main_map_screen.dart';

class DestinationIndexViewModel with ChangeNotifier {
  final List<Destination> _destinations = [
    Destination(
        destinationName: "中目黒",
        latitude: 35.64521886511285,
        longitude: 139.69915038298086,
        createDateTime: DateTime.now()),
    Destination(
        destinationName: "八丁堀",
        latitude: 35.675409386302164,
        longitude: 139.77705955395265,
        createDateTime: DateTime.now()),
    Destination(
        destinationName: "羽田空港第一ターミナル駅",
        latitude: 35.54918913047661,
        longitude: 139.7847184834618,
        createDateTime: DateTime.now()),
    Destination(
        destinationName: "道の駅みかも",
        latitude: 36.296735866868545,
        longitude: 139.62515591380242,
        createDateTime: DateTime.now()),
  ];

  List<Destination> get destinations => _destinations;

  void pushCompass(BuildContext context, int index) {
    final vm = context.read<CompassViewModel>();
    vm.setDestination(_destinations[index]);
    Navigator.push(context, CompassScreen.route());
  }

  void deleteDestination(int index) {
    _destinations.remove(index);
    notifyListeners();
  }

  void pushMap(BuildContext context, int index) {
    final vm = context.read<MainMapViewModel>();

    vm.setDestination(_destinations[index]);
    Navigator.push(context, MainMapScreen.route());
  }
}
