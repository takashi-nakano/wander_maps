import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:wander_maps/data/db/dao.dart';

part 'database.g.dart';

class DestinationRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get destinationName => text()();

  RealColumn get latitude => real()();

  RealColumn get longitude => real()();

  DateTimeColumn get createDate => dateTime()();
}

@DriftDatabase(tables: [DestinationRecords], daos: [DestinationDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'wamder_maps.db'));
    return NativeDatabase(file);
  });
}
