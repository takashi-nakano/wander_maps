import 'package:flutter/material.dart';
import 'package:wander_maps/data/consts/enum.dart';
import 'package:wander_maps/data/db/dao.dart';
import 'package:wander_maps/data/db/database.dart';
import 'package:wander_maps/data/models/destination.dart';
import 'package:wander_maps/data/util/extentions.dart';

class DestinationRepository extends ChangeNotifier {
  final DestinationDao _dao;

  DestinationRepository({dao}) : _dao = dao;

  List<Destination> _destinations = [];

  List<Destination> get destination => _destinations;

  LoadStatus _loadStatus = LoadStatus.DONE;

  LoadStatus get loadStatus => _loadStatus;

  Future getDestination() async {
    _loadStatus = LoadStatus.LOADING;
    List<DestinationRecord> result = await _dao.selectAll;
    _destinations = result.toDestination(result);
    _loadStatus = LoadStatus.DONE;
  }

  Future<void> addDestination(Destination destination) async {
    DestinationRecord record = DestinationRecord(
        id: 0,
        destinationName: destination.destinationName,
        latitude: destination.latitude,
        longitude: destination.longitude,
        createDate: DateTime.now());
    await _dao.addDestination(record);

    notifyListeners();
  }

  Future<void> insert(List<Destination> destinations) async {
    List<DestinationRecord> records = [
      DestinationRecord(
          longitude: 36.0,
          latitude: 139.0,
          id: 1,
          createDate: DateTime.now(),
          destinationName: "test")
    ];

    await _dao.insert(records);
    await getDestination();
    notifyListeners();
  }

  Future<void> delete(int i) async{
    await _dao.deleteRecord(i);
  }

}
