import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/ui/components/compass/display_distance.dart';
import 'package:wander_maps/ui/viewmodels/compass_viewmodel.dart';

class CompassScreen extends StatelessWidget {
  const CompassScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CompassScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size.width * 0.8;
    final vm = context.watch<CompassViewModel>();

    vm.gpsListener();
    vm.compassListener();

    return Scaffold(
      appBar: AppBar(
        title: const Text("until destination"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            vm.destination.destinationName,
            style: const TextStyle(fontSize: 36),
          ),
          DisplayDistance(distanceMeters: vm.distance),
          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Center(
                  child: Transform.rotate(
                    angle: vm.compassAngle,
                    child: Image.asset(
                      'assets/images/vezel.png',
                      width: baseSize,
                      height: baseSize,
                    ),
                  ),
                ),
                Center(
                  child: Transform.rotate(
                    angle: vm.arrowAngle,
                    child: Image.asset(
                      'assets/images/arrow.png',
                      width: baseSize * 0.5,
                      height: baseSize * 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
