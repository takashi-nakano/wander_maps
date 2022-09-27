import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/ui/viewmodels/main_map_viewmodel.dart';

class FormSection extends StatelessWidget {
  const FormSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MainMapViewModel>();
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              initialValue: (vm.destination.destinationName == "")
                  ? '${vm.destination.latitude.toString()}, ${vm.destination.longitude.toString()}'
                  : vm.destination.destinationName,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_searching),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.add_location_alt,
                      color: Colors.blue, size: 32),
                  onPressed: () => print("register") // vm.pushCompass(context),
                  ),
              IconButton(
                icon: const Icon(Icons.arrow_circle_up_sharp,
                    color: Colors.blue, size: 32),
                onPressed: () => vm.pushCompass(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
