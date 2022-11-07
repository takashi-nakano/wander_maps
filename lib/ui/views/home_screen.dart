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
                    text: "現在地表示"),
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
                    text: "地点検索"),
                CustomButton(
                    onPressed: () => vm.pushIndex(context), text: "設定地点一覧"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
