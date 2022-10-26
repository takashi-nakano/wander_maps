import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/data/consts/enum.dart';
import 'package:wander_maps/data/models/destination.dart';
import 'package:wander_maps/data/repositories/destination_repository.dart';
import 'package:wander_maps/ui/viewmodels/compass_viewmodel.dart';
import 'package:wander_maps/ui/viewmodels/main_map_viewmodel.dart';
import 'package:wander_maps/ui/views/compass_screen.dart';
import 'package:wander_maps/ui/views/main_map_screen.dart';

class DestinationIndexViewModel with ChangeNotifier {

  DestinationIndexViewModel({repository}) : _repository = repository;

  final DestinationRepository _repository;

  List<Destination> _destinations = [];

  LoadStatus _loadStatus = LoadStatus.DONE;

  LoadStatus get loadStatus => _loadStatus;

  List<Destination> get destinations => _destinations;

  void pushCompass(BuildContext context, int index) {
    final vm = context.read<CompassViewModel>();
    vm.setDestination(_destinations[index]);
    Navigator.push(context, CompassScreen.route());
  }

  Future<void> deleteDestination(int id) async {
    await _repository.delete(id);
    await getDestinationList();
  }

  void pushMap(BuildContext context, int index) {
    final vm = context.read<MainMapViewModel>();

    vm.setDestination(_destinations[index]);
    Navigator.push(context, MainMapScreen.route());
  }

  Future getDestinationList() async {
    _loadStatus = LoadStatus.LOADING;
    notifyListeners();
    await _repository.getDestination();
    _destinations = _repository.destinations;
    _loadStatus = _repository.loadStatus;
    notifyListeners();
    print(_repository);
  }

  onRepositoryUpdates(DestinationRepository repository) {
    _destinations = repository.destinations;
    _loadStatus= repository.loadStatus;
    notifyListeners();
  }
}
