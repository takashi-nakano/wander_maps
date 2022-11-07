import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/ui/viewmodels/main_map_viewmodel.dart';

class MapSection extends StatelessWidget {
  const MapSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MainMapViewModel>();

    return GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: vm.cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          vm.setMapController(controller);
        },
        onTap: (LatLng latLng) {
          vm.tapMap(latLng);
        },
        markers: vm.markers);
  }
}
