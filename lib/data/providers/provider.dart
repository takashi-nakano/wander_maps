import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wander_maps/data/db/dao.dart';
import 'package:wander_maps/data/db/database.dart';
import 'package:wander_maps/data/repositories/destination_repository.dart';
import 'package:wander_maps/ui/viewmodels/compass_viewmodel.dart';
import 'package:wander_maps/ui/viewmodels/destination_index_viewmodel.dart';
import 'package:wander_maps/ui/viewmodels/home_viewmodel.dart';
import 'package:wander_maps/ui/viewmodels/main_map_viewmodel.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<MyDatabase>(
    create: (_) => MyDatabase(),
    dispose: (_, db) => db.close(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<MyDatabase, DestinationDao>(
      update: (_, db, dao) => DestinationDao(db)),
  ChangeNotifierProvider<DestinationRepository>(
      create: (context) =>
          DestinationRepository(dao: context.read<DestinationDao>())),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider(
    create: (_) => HomeViewModel(),
  ),
  ChangeNotifierProvider(
    create: (_) => CompassViewModel(),
  ),
  ChangeNotifierProvider(
      create: (context) =>
          MainMapViewModel(repository: context.read<DestinationRepository>())),
  ChangeNotifierProxyProvider<DestinationRepository, DestinationIndexViewModel>(
    create: (context) => DestinationIndexViewModel(
      repository: context.read<DestinationRepository>(),
    ),
    update: (context, repository, viewModel) =>
        viewModel!..onRepositoryUpdates(repository),
  ),
];
