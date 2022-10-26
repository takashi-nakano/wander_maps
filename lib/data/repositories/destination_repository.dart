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

  List<Destination> get destinations => _destinations;

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
    await getDestination();
    notifyListeners();
  }

  Future<void> delete(int id) async {
    await _dao.deleteRecord(id);
  }
}
