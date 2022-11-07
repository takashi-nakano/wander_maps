import 'package:flutter/material.dart';

class DisplayDistance extends StatelessWidget {
  const DisplayDistance({Key? key, required this.distanceMeters})
      : super(key: key);

  final double distanceMeters;

  @override
  Widget build(BuildContext context) {
    String unit = "";
    final intDistance = distanceMeters.round();
    String displayDistance = "";
    if (intDistance > 10000) {
      displayDistance = (intDistance / 1000).round().toString();
      unit = " km";
    } else if (intDistance > 2000) {
      displayDistance = (intDistance / 1000).toStringAsFixed(1);
      unit = " km";
    } else {
      displayDistance = intDistance.round().toString();
      unit = " m";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          displayDistance,
          style: const TextStyle(fontSize: 36.0),
        ),
        Text(
          unit,
          style: const TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
