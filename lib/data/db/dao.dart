import 'package:drift/drift.dart';
import 'package:wander_maps/data/db/database.dart';
import 'package:wander_maps/data/models/destination.dart';

part 'dao.g.dart';

@DriftAccessor(tables: [DestinationRecords])
class DestinationDao extends DatabaseAccessor<MyDatabase>
    with _$DestinationDaoMixin {
  DestinationDao(MyDatabase attachedDatabase) : super(attachedDatabase);

  Future insert(List<DestinationRecord> destinations) async {
    await batch((batch) {
      batch.insertAll(destinationRecords, destinations);
    });
  }

  Future<List<DestinationRecord>> get selectAll =>
      select(destinationRecords).get();

  // Future addDestination(Destination destination) async {
  //   DestinationRecordsCompanion.insert(
  //       longitude: destination.longitude,
  //       latitude: destination.latitude,
  //       destinationName: destination.destinationName,
  //       createDate: DateTime.now());
  // }

  Future addDestination(DestinationRecord record) async {
    await db.into(db.destinationRecords).insert(
        DestinationRecordsCompanion.insert(
            destinationName: record.destinationName,
            latitude: record.latitude,
            longitude: record.longitude,
            createDate: DateTime.now()));
  }

  Future deleteRecord(int i) async {
    await (db.delete(db.destinationRecords)
          ..where((tbl) => tbl.id.equals(i)))
        .go();
  }
}
