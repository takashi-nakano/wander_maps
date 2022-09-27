import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wander_maps/ui/viewmodels/compass_viewmodel.dart';
import 'package:wander_maps/ui/viewmodels/destination_index_viewmodel.dart';
import 'package:wander_maps/ui/viewmodels/home_viewmodel.dart';
import 'package:wander_maps/ui/viewmodels/main_map_viewmodel.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [];

List<SingleChildWidget> dependentModels = [];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider(
    create: (_) => HomeViewModel(),
  ),
  ChangeNotifierProvider(
    create: (_) => CompassViewModel(),
  ),
  ChangeNotifierProvider(
    create: (_) => MainMapViewModel(),
  ),
  ChangeNotifierProvider(
    create: (_) => DestinationIndexViewModel(),
  ),
];
