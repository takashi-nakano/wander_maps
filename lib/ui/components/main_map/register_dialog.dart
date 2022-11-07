import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/ui/components/common/custom_toast.dart';
import 'package:wander_maps/ui/viewmodels/main_map_viewmodel.dart';

class RegisterDialog extends StatelessWidget {
  const RegisterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MainMapViewModel>();

    return AlertDialog(
      title: const Text("この場所を登録しますか"),
      content: SizedBox(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("タイトル："),
            Expanded(
              child: TextFormField(
                controller: vm.textEditingController,)
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("戻る"),
          style: ElevatedButton.styleFrom(primary: Colors.grey),
        ),
        ElevatedButton(
          onPressed: () {
            vm.addDestination();
            Navigator.of(context).pop();
            final fToast = FToast();
            fToast.init(context);
            fToast.showToast(
              child: const CustomToast(
                msg: "登録しました",
                color: Colors.lightBlue,
              ),
              gravity: ToastGravity.BOTTOM,
            );
          },
          child: const Text("登録する"),
          style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
        ),
      ],
    );
  }
}
