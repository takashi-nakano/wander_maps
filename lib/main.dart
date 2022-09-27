import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/data/providers/provider.dart';
import 'package:wander_maps/ui/views/compass_screen.dart';
import 'package:wander_maps/ui/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future(() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: globalProviders,
      child: const MaterialApp(
        title: 'Flutter Google Maps Demo',
        home: HomeScreen(),
      ),
    );
  }
}
