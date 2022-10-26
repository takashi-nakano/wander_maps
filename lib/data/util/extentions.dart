import 'package:wander_maps/data/db/database.dart';
import 'package:wander_maps/data/models/destination.dart';

extension ConvertToDestination on List<DestinationRecord> {
  List<Destination> toDestination(List<DestinationRecord> destinationRecords) {
    List<Destination> destinations = [];
    destinationRecords.forEach((destinationRecord) {
      destinations.add(Destination(
        id: destinationRecord.id,
        destinationName: destinationRecord.destinationName,
        longitude: destinationRecord.longitude,
        latitude: destinationRecord.latitude,
        createDateTime: destinationRecord.createDate,
      ));
    });
    return destinations;
  }
}
