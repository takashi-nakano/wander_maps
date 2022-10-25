import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/data/models/destination.dart';
import 'package:wander_maps/ui/viewmodels/destination_index_viewmodel.dart';

class DestinationTile extends StatelessWidget {
  const DestinationTile(
      {Key? key, required this.destination, required this.index})
      : super(key: key);

  final Destination destination;
  final int index;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<DestinationIndexViewModel>();

    return Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onLongPress: () {
            print("delete");
            vm.deleteDestination(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(destination.destinationName),
                )),
                IconButton(
                    onPressed: () => vm.pushMap(context, index),
                    icon: const Icon(Icons.location_on)),
                IconButton(
                  onPressed: () => vm.pushCompass(context, index),
                  icon: const Icon(Icons.outbond_outlined),
                ),
//                const Icon(Icons.)
              ],
            ),
          ),
        ));
  }
}
