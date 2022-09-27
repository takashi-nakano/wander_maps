import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/ui/components/common/custom_button.dart';
import 'package:wander_maps/ui/components/home/search_modal.dart';
import 'package:wander_maps/ui/viewmodels/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                CustomButton(
                    onPressed: () => vm.pushQuickSet(context),
                    text: "quick set"),
                CustomButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return const SearchModal();
                        },
                      );
                    },
                    text: "search"),
                CustomButton(
                    onPressed: () => vm.pushIndex(context), text: "index"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
