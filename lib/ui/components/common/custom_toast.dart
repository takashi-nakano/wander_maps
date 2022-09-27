import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  ///Toast表示コンポーネント
  const CustomToast(
      {Key? key, required this.msg, this.color = Colors.redAccent})
      : super(key: key);

  final String msg;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Text(msg),
    );
  }
}
