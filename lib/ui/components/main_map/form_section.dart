import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/ui/components/main_map/register_dialog.dart';
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
            child: Row(
              children: [
                IconButton(
                  onPressed: () => vm.copyLatLng(context),
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Text(vm.textEditingController.text),
                ),
              ],
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
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => const RegisterDialog()),
//                    vm.addDestination(), // vm.pushCompass(context),
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
