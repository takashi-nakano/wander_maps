import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/data/consts/enum.dart';
import 'package:wander_maps/ui/components/destination_index/DestinationTile.dart';
import 'package:wander_maps/ui/viewmodels/destination_index_viewmodel.dart';

class DestinationIndexScreen extends StatelessWidget {
  const DestinationIndexScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const DestinationIndexScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DestinationIndexViewModel>();

    if (vm.loadStatus != LoadStatus.LOADING && vm.destinations.isEmpty) {
      Future(() => vm.getDestinationList());
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("設定地点一覧"),
          centerTitle: true,
        ),
        body: vm.loadStatus == LoadStatus.LOADING
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: vm.destinations.length,
                itemBuilder: (context, int index) => DestinationTile(
                    destination: vm.destinations[index], index: index),
              ),
      ),
    );
  }
}
